
import 'package:fasateen/lib/core/api/request.dart';
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/static/api.dart';
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:fasateen/lib/ui/my_account/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'dart:async';


abstract class VerificationController extends GetxController {
  void previsePage();

  void nextPage();
}

class VerificationControllerImp extends VerificationController {

  MyServices myServices = Get.find<MyServices>();
  UserModel userModel = UserModel();

  TextEditingController? textEditingController = TextEditingController();

  FocusNode myFocusNode = FocusNode();
  String? previseRoute = Get.arguments[0];



  ApiClientService apiClientService = Get.find<ApiClientService>();

  @override
  void previsePage() {
    Get.back();
  }

  @override
  void nextPage() async {
    var theVerificationCodeSent = await apiClientService.postRequest(
      ApiStatic.sendVerifyCode,
      null,
      {
        "phone": myServices.sharedPreferences.getString("phone"),
        "code": textEditingController!.text,
      },
   {
     'Accept' : 'application/json'}
    );
    log("one");
    if (previseRoute == AppRoute.login &&
        theVerificationCodeSent!.statusCode == 200) {
      log("two");
      UserModel.fromJson(theVerificationCodeSent.data);
      userModel = UserModel.fromJson(theVerificationCodeSent.data);
      myServices.sharedPreferences.setString("image","https://fasateen.vroad.co${userModel.image}");
      myServices.sharedPreferences.setString("fullName","${userModel.fullName}");
      myServices.sharedPreferences.setString("gender","${userModel.gender}");
      myServices.sharedPreferences.setString("phone","${userModel.phone}");
      myServices.sharedPreferences.setString("token","Bearer ${userModel.token}");
      myServices.sharedPreferences.setString("city","${userModel.city}");
      myServices.sharedPreferences.setString("user","found");
      Get.offAllNamed(AppRoute.indexedStack);
    }
    else if (theVerificationCodeSent!.statusCode == 200) {
    log("three");
        Get.offNamed(AppRoute.signUpTwo);
    myServices.sharedPreferences.setString("user","found");
    }
  }

  int min = 2;
  int sec = 0;

  timer(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (sec > 0) {
        sec--;
      } else if (sec == 0 && min > 0) {
        min--;
        sec = 59;
      } else if (sec == 0 && min == 0) {
        timer.cancel();
      }
      update();
    });
  }
  resend()async{
    if(min == 0 && sec == 0){
       await apiClientService.postRequest(
          ApiStatic.getVerifyCode,
          null,
          {"phone": myServices.sharedPreferences.getString("phone")},
          null);
       min = 4 ;
       sec = 0 ;
       update();
       timer();
    }
  }

  @override
  void onInit() {
    super.onInit();
    timer();
  }
}


class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationControllerImp());
  }
}