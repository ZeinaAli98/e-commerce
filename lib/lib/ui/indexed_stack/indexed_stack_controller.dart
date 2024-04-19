

import 'package:fasateen/lib/data/models/fire_base_notification.dart';
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/ui/discount/discount_controller.dart';
import 'package:fasateen/lib/ui/favorite/favorite_controller.dart';
import 'package:fasateen/lib/ui/home/home_controller.dart';
import 'package:fasateen/lib/ui/setting/setting_controller.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../discount/discount_page_view.dart';
import '../favorite/favorite_page_view.dart';
import '../setting/setting_page_view.dart';
import 'package:flutter/material.dart';
import '../home/home_page_view.dart';
import 'package:get/get.dart';


abstract class IndexedStackController extends GetxController {
  void firstIndex();
  void secondIndex();
  void thirdIndex();
  void fourthIndex();
  bool firstCondition();
  bool secondCondition();
  bool thirdCondition();
  bool fourthCondition();
  void fifthCondition();
}

class IndexedStackControllerImp extends IndexedStackController {


  List<Widget> pages = const [
    HomePageView(),
    DiscountPageView(),
    FavoritePageView(),
    SettingPageView(),
  ];

  GlobalKey? bottomAppBarKey = GlobalKey();
  Key? indexedStackKey = GlobalKey();
  int currentBottomBarIndex = 0;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void firstIndex() {
    currentBottomBarIndex = 0;
    update();
  }

  @override
  secondIndex() {
    currentBottomBarIndex = 1;
    update();
  }

  @override
  thirdIndex() {
    currentBottomBarIndex = 2;
    update();
  }

  @override
  fourthIndex() {
    currentBottomBarIndex = 3;
    update();
  }

  @override
  bool firstCondition() {
    return currentBottomBarIndex == 0;
  }

  @override
  bool secondCondition() {
    return currentBottomBarIndex == 1;
  }

  @override
  bool thirdCondition() {
    return currentBottomBarIndex == 2;
  }

  @override
  bool fourthCondition() {
    return currentBottomBarIndex == 3;
  }

  @override
  void fifthCondition() {
    Get.toNamed(AppRoute.categories, arguments: [
      ImageAsset.plusImage,
      AppRoute.addAdvertisementInfo,
      "chooseTheCategoryOfTheAdvertisement".tr
    ]);
    print(AppRoute.addAdvertisementInfo);
  }

  @override
  void onInit() {
    FireBaseNotification().initialize(flutterLocalNotificationsPlugin);
    super.onInit();
  }

}

class IndexStackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IndexedStackControllerImp());
    Get.lazyPut(() => HomePageControllerImp());
    Get.lazyPut(() => DiscountPageControllerImp());
    Get.lazyPut(() => FavoritePageControllerImp());
    Get.lazyPut(() => SettingPageControllerImp());
  }
}