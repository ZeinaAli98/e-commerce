
import 'package:fasateen/lib/core/api/request.dart';
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:fasateen/lib/ui/authentication/sign_in/widget/login_bottom_sheet.dart';
import 'package:fasateen/lib/ui/my_account/model/user_model.dart';
import 'package:fasateen/lib/ui/my_account/model/user_response.dart';
import 'package:flutter/material.dart';
import '../../../static/api.dart';
import 'package:get/get.dart';
import 'dart:core';

abstract class LoginPageController extends GetxController {
  String? phoneNumberValidation(text);
  String? passwordValidation(text);
  Widget? buttonSheet();
  void goBack();
  void openTheBottomSheet();
  void goToVerification();

  void goToSingUp();
}

class LoginPageControllerImp extends LoginPageController {
  MyServices myServices = Get.find<MyServices>();

  ApiClientService apiClientService = Get.find<ApiClientService>();
  bool  isShowPassword =true;


  UserModel userModel = UserModel();

  UserResponse userResponse = Get.find<UserResponse>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool showBottomSheet = true;

  String loginPageMassage = "";

  bool isSignInButtonClicked = false;

  TextEditingController phoneNumberController =
      TextEditingController();

  String? phoneNumberValue;

  TextEditingController passwordController = TextEditingController();

  late Map<String, dynamic> sendData;

  String password = "";
  final Rx<bool> _colored = false.obs ;
  get colored => _colored.value ;
  set colored(value)=> _colored.value = value;

  String? onChangePassword(value){
    password  = value;
    print("$colored");
    colored = password.split("").isNotEmpty ? colored == true : colored == false;
    print("$colored");
    return null;
  }
  showPassword (){

    isShowPassword=isShowPassword== true? false:true;
    update();
  }
  var selectedItem ="".obs;
  void upDateSelectedItem(String value)
  {
    selectedItem.value= value;
    
    update();
  }


  @override
  String? phoneNumberValidation(text) {
    if ((!GetUtils.isPhoneNumber(text))) {
      return "invalid Number".tr;
    }
    return null;
  }

  @override
  String? passwordValidation(text) {
    if (text.length < 5) {

      return "password short".tr;
    }
    return null;
  }

  @override
  Widget? buttonSheet() {
    showBottomSheet = !showBottomSheet;
    update();
    return null;
  }

  @override
  void goBack() {
    Get.back();
  }



  @override
  void goToSingUp() {
    Get.toNamed(AppRoute.signUpOne);
  }

  @override
  void openTheBottomSheet() async {
    await changeSignInButtonClickedState();
    if (formKey.currentState!.validate()) {
     if(isSignInButtonClicked == false){
       isSignInButtonClicked = true;
       var userInfo = await apiClientService.postRequest(
          ApiStatic.loginUrl,
          null,
          {
            "phone": phoneNumberController!.text.trim(),
            "password": passwordController!.text.trim(),
          },
          null);
      if (userInfo!.statusCode == 200 ){
        Get.bottomSheet(const LoginBottomSheet());
        myServices.sharedPreferences
            .setString("phone", phoneNumberController!.text.trim());
      } else {
        isSignInButtonClicked = true;
        loginPageMassage = userInfo.data["message"];
        dialog();
      }
    }
    }
  }

  Future<void> changeSignInButtonClickedState()async {
    Future.delayed(const Duration(seconds: 2),(){
      isSignInButtonClicked = false;
    });
  }

  @override
  void goToVerification() async {
    if (formKey.currentState!.validate()) {
      var verification = await apiClientService.postRequest(
          ApiStatic.getVerifyCode,
          null,
          {"phone": phoneNumberController!.text.trim()},
          null);
      if (verification!.statusCode == 200) {
        Get.toNamed(AppRoute.verification, arguments: [AppRoute.login,verification.data["result"]["code"]]);
      }
    }
  }

  Future<Widget?> dialog() {
    return Get.defaultDialog(middleText: loginPageMassage, actions: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            fixedSize: const Size(100, 20)),
        onPressed: () {
          Get.back();
        },
        child: const Text(
          "Ok",
        ),
      ),
    ]);
  }
}

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageControllerImp());
  }
}
