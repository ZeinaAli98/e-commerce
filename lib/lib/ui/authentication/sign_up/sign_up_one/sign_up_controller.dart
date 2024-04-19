import 'dart:async';


import 'package:fasateen/lib/core/api/request.dart';
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/static/api.dart';
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:fasateen/lib/ui/my_account/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  String? nameValidation(String? value);

  String? phoneNumberValidation(String? value);

  String? whatsappNumberValidation(String? value);

  String? passwordValidation(String? value);

  String? passwordConfirmationValidation(String? value);

  onChangeValue(bool? value);

  void termsAndConditions();

  void loginPage();

  void goToVerification();

  Future<Widget?> dialog();
  Future<Widget?> alertAgreeCondition();
}

class SignUpControllerImp extends SignUpController {
  MyServices myServices = Get.find<MyServices>();

  UserModel userModel = UserModel();

  bool isChecked = false;

  String signUpPageMassage = "";

  FocusNode myFocusNode = FocusNode();

  TextEditingController firstNameController = TextEditingController(text: "");

  TextEditingController lastNameController = TextEditingController(text: "");

  TextEditingController phoneNumberController = TextEditingController(text: "");

  TextEditingController whatsappNumberController =
      TextEditingController(text: "");

  TextEditingController passwordController = TextEditingController(text: "");

  TextEditingController confirmationPasswordController =
      TextEditingController(text: "");

  ApiClientService apiClientService = Get.find<ApiClientService>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool  isShowPassword =true;
  showPassword (){

    isShowPassword=isShowPassword== true ? false:true;
    update();
  }

  @override
  String? nameValidation(value) {
    if (value!.isEmpty) {
      return "invalid Name".tr;
    }
    return null;

  }

  @override
  String? phoneNumberValidation(value) {
    if ((!GetUtils.isPhoneNumber(value!))) {
      return "invalid Number".tr;
    }

  }

  @override
  String? whatsappNumberValidation(value) {
    if ((!GetUtils.isPhoneNumber(value!))) {
      return "invalid Number".tr;
    }

  }

  @override
  String? passwordValidation(value) {
    if (value!.length < 5) {
      return "password short".tr;
    }

  }

  @override
  String? passwordConfirmationValidation(value) {
    if (value!.length < 5) {
      return "password short".tr;
    } else if (passwordController.text != confirmationPasswordController.text) {
      return "Not match".tr;
    }
  }

  @override
  onChangeValue(value) {
    isChecked = value ?? false;
    update();
  }

  @override
  void termsAndConditions() {
    Get.toNamed(AppRoute.termsAndCondition);
  }

  @override
  void loginPage() {
    Get.back();
  }

  @override
  Future<Widget?> dialog() {
    return Get.defaultDialog(middleText: signUpPageMassage, actions: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            fixedSize: Size(Get.height * 0.1185637, Get.width * 0.0486111,),),
        onPressed: () {
          Get.back();
        },
        child: const Text(
          "Ok",
        ),
      ),
    ]);
  }

  @override
  goToVerification() async {
    if (formKey.currentState!.validate()) {
      if(isChecked== false){
        alertAgreeCondition();
      }else{
        var userInfo = await apiClientService.postRequest(
            ApiStatic.signUpUrl,
            null,
            {
              "full_name":
              "${firstNameController.text.toString()} ${lastNameController.text.toString()}",
              "phone": phoneNumberController.text.toString(),
              "password": passwordController.text.toString(),
              "password_confirmation": confirmationPasswordController.text.toString(),
              "whatsapp_phone": whatsappNumberController.text.toString(),
            },
            {
              'Accept' : 'application/json'
            });
        if(userInfo !=null) {
          if (userInfo.statusCode == 200 ) {
            print(userInfo.statusCode);
            await apiClientService.postRequest(ApiStatic.getVerifyCode, null,
                {"phone": phoneNumberController.text.toString()}, null);
            UserModel.fromJson(userInfo.data);
            userModel = UserModel.fromJson(userInfo.data);

            myServices.sharedPreferences.setString(
                "image", "https://fasateen.vroad.co${userModel.image}");
            myServices.sharedPreferences
                .setString("fullName", "${userModel.fullName}");
            myServices.sharedPreferences
                .setString("gender", "${userModel.gender}");
            myServices.sharedPreferences.setString(
                "phone", "${userModel.phone}");
            myServices.sharedPreferences
                .setString("wPhone", "${userModel.wPhone}");
            myServices.sharedPreferences
                .setString("token", "Bearer ${userModel.token}");
            myServices.sharedPreferences.setString(
                "city", "${userModel.city}");
            Get.toNamed(
                AppRoute.verification, arguments: AppRoute.signUpOne);
          } else {


            signUpPageMassage = userInfo.data["message"].toString();

            dialog();

          }
        }

      }



    }
  }

  @override
  Future<Widget?> alertAgreeCondition() {

  return  Get.defaultDialog(
        title: "",
        titleStyle: TextStyle(fontSize: Get.width*0.002),
        barrierDismissible: false,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: Get.height *0.005),
              child: Image.asset("assets/images/alert.jpg",
                height: Get.width * 0.19, width: Get.width * 0.19,
              ),
            ),
            SizedBox(height: Get.height *0.01,),
            Text("Please agree to the terms and conditions policy".tr,
              style:TextStyle(fontSize: Get.width * 0.035,fontWeight: FontWeight.w500) ,)

          ],
        ),
        actions: [
          MaterialButton(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColor.primaryColor,
                )),

            onPressed: () {
             onChangeValue(true);
              Get.back();
            },
            child: Text(
              "Confirm".tr,
              style: TextStyle(
                color: AppColor.primaryColor,
              ),
            ),
          ),
          MaterialButton(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColor.primaryColor,
                )),
            color: AppColor.primaryColor,
            onPressed: () {
              Get.back();
            },
            child: Text(
              "Cancel".tr,
              style: TextStyle(
                color: AppColor.textBodyColorTwo,
              ),
            ),
          ),
        ]);

  }
}


class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp());
  }
}