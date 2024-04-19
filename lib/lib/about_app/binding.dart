
import 'package:fasateen/lib/core/api/request.dart';
import 'package:fasateen/lib/ui/add_advertisement/add_advertisement_controller.dart';
import 'package:fasateen/lib/ui/category_pill_page/category_page_controller.dart';
import 'package:fasateen/lib/ui/edit_my_profile/edit_my_acount_controller.dart';
import 'package:fasateen/lib/ui/my_account/my_account_controller.dart';
import 'package:fasateen/lib/ui/product/product_controller.dart';
import 'package:fasateen/lib/ui/product/widgets/product_page_view_body.dart';
import 'package:fasateen/lib/ui/splash/splash_controller.dart';

import '../ui/my_account/model/user_response.dart';

import '../ui/my_account/model/user_model.dart';
import '../ui/search/search_controller.dart';
import 'package:get/get.dart';



class AppBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>SplashPageControllerImp());
    Get.lazyPut(()=>ApiClientService());
    Get.lazyPut(()=>UserModel());
    Get.lazyPut(()=>UserResponse<dynamic>());
    Get.lazyPut(()=>CategoryPillPageControllerImp());
    Get.lazyPut(()=>ProductControllerImp());
    Get.lazyPut(()=>AddAdvertisementControllerImp());
    Get.lazyPut(()=>MyAccountControllerImp());
    Get.lazyPut(()=> ProductPageViewBody());
    Get.lazyPut(()=>EditMyAccountControllerImp());
  }

}
/*
class LoginBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>LoginPageControllerImp());
    Get.lazyPut(()=>ApiClientService());
    Get.lazyPut(()=>UserResponse());
    Get.lazyPut(()=>VerificationControllerImp());
    Get.lazyPut(()=>SignUpControllerImp());
  }

}



class VerificationBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>VerificationControllerImp());
    Get.lazyPut(()=>SignUpControllerImp());
    Get.lazyPut(()=>SignUpControllerTwoImp());
  }

}
class SignUpTwoBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>SignUpControllerTwoImp());
    Get.lazyPut(()=>ApiClientService());
    Get.lazyPut(()=>HomePageControllerImp());

  }

}
class IndexStackBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>SettingPageControllerImp());
    Get.lazyPut(()=>HomePageControllerImp());
    Get.lazyPut(()=>DiscountPageControllerImp());
    Get.lazyPut(()=>FavoritePageControllerImp());
    Get.lazyPut(()=>ApiClientService());
  }

}*/
/*
class HomePageBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>HomePageControllerImp());

  }

}*/
/*class FavoritePageBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>SettingPageControllerImp());
    Get.lazyPut(()=>FavoritePageControllerImp());
    Get.lazyPut(()=>ApiClientService());
  }

}*/
/*
class DiscountPageBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>DiscountPageControllerImp());

    Get.lazyPut(()=>ApiClientService());
  }

}
class SettingPageBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>SettingPageControllerImp());
    Get.lazyPut(()=>ApiClientService());
  }

}
*/






