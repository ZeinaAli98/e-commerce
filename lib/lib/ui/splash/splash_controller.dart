
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:get/get.dart';
class SplashPageController extends GetxController{

}

class SplashPageControllerImp extends SplashPageController{
  MyServices myServices = Get.find<MyServices>();
   transition(){
     Future.delayed(
         const Duration(
           seconds: 1,
         ), ()async {
      var token= await myServices.sharedPreferences.getString("token");
      print("errrrrrrrrrorrrr$token");
      if (token !=null){
        Get.offNamed(AppRoute.indexedStack);
      }else{
        Get.offNamed(AppRoute.login);
      }
     });
   update();
  }
  @override
  void onInit() {
    transition();
    super.onInit();
  }
}