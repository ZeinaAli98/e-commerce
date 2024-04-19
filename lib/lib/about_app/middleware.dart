
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/static/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleWare extends  GetMiddleware {

  MyServices myServices = Get.find<MyServices>();

  @override
  RouteSettings? redirect(String? route) {
    if(myServices.sharedPreferences.getString("user") != null){
      return const RouteSettings(name: AppRoute.indexedStack);
    }
    return super.redirect(route);
  }
}