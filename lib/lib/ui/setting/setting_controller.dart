
import 'package:fasateen/lib/core/api/request.dart';
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../authentication/sign_in/login_controller.dart';

abstract class SettingPageController extends GetxController {
  void termsAndCondition();

  void privacyPolicy();

  void language();

  void contactUs();

  void logOut();
}

class SettingPageControllerImp extends SettingPageController {
  GlobalKey? bottomAppBarKey = GlobalKey();
  int currentBottomBat = 0;

  MyServices myServices = Get.find<MyServices>();
  ApiClientService apiClientService = Get.find<ApiClientService>();
  @override
  void language() {
    Get.toNamed(AppRoute.language);
  }

  @override
  void privacyPolicy() {
    Get.toNamed(AppRoute.privacyPolicy);
  }

  @override
  void contactUs() {
    Get.toNamed(AppRoute.contactUs);
  }

  @override
  void termsAndCondition() {
    Get.toNamed(AppRoute.termsAndCondition);
  }
  @override
  void logOut() async {
    await myServices.sharedPreferences.remove('token');
    await myServices.sharedPreferences.remove('user');
    Get.offNamed(AppRoute.login);
  }

  @override
  deleteAccount() async {
     await apiClientService.postRequest("api/customer/logout", null, {
      "phone": "0956776008",
      "password": "123123"
    }, {
      "Authorization":  myServices.sharedPreferences.getString("token")
    }
    );

    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);

  }


}

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingPageControllerImp());
  }
}