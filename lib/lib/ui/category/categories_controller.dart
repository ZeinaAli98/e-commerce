import 'dart:developer';

import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/ui/home/home_controller.dart';
import 'package:get/get.dart';


abstract class CategoriesController extends GetxController {

}
class CategoriesControllerImp extends CategoriesController{
  MyServices myServices = Get.find<MyServices>();
  String? language ;
  List colorList = [];
  HomePageControllerImp homePageControllerImp = Get.find<HomePageControllerImp>();
  makeColorList(){
      for(int x = 0 ; x < homePageControllerImp.categoryList.length;x++ ){
        colorList.add(AppColor.borderBoxColor.obs);
      }
  }

  onTapUpEvent(index){
    log("up");
    colorList[index] =
        AppColor.borderBoxColor.obs;
    Get.toNamed(Get.arguments[1], arguments: [
      language == "ar"
          ? homePageControllerImp
          .categoryList[index].arName
          : homePageControllerImp
          .categoryList[index].enName,
      "https://fasateen.vroad.co${homePageControllerImp.categoryList[index].image}",
      language == "ar"
          ? "${homePageControllerImp.categoryList[index].enName}نوع "
          : "${homePageControllerImp.categoryList[index].enName} Type",
      language == "ar"
          ? "${homePageControllerImp.categoryList[index].enName}حالة "
          : "${homePageControllerImp.categoryList[index].enName} Condition",]);
    update();
  }
  onTapDownEvent(index){
    log("down");
    colorList[index] =
        AppColor.activeCategoryColor.obs;
    update();
  }



  @override
  void onInit() {
     language = myServices.sharedPreferences.getString("lang");

     makeColorList();
    super.onInit();
  }
}

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoriesControllerImp());
  }
}