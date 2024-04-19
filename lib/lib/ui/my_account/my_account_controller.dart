import 'dart:developer';

import 'package:fasateen/lib/core/api/request.dart';
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/data/models/my_product_model.dart';
import 'package:fasateen/lib/static/api.dart';
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:get/get.dart';

import 'model/user_model.dart';

abstract class MyAccountController extends GetxController{
  postAnNewAdd();
  getMyProduct();


}
class MyAccountControllerImp extends MyAccountController{

  ApiClientService apiClientService = Get.find<ApiClientService>();

  MyServices myServices = Get.find<MyServices>();

  MyProductModel myProductModel= MyProductModel();
  UserModel userModel=UserModel();
  List userInfo=[];

  bool isProfileLoading = true;

  bool isMyProductLoading = true;
  List myProductsList = [];


  @override
   getMyProduct() async {
    var getProducts =
    await apiClientService.getRequest(ApiStatic.getMyProduct, {"page":"0"}, {
      'Accept': 'application/json',
      'Authorization': myServices.sharedPreferences.getString("token"),
    });
    if (getProducts != null) {
      myProductModel.fromJsonArray(getProducts.data);
      myProductsList = myProductModel.fromJsonArray(getProducts.data);

      isMyProductLoading = false;
      update();
    }
  }



  @override
    postAnNewAdd(){
    Get.toNamed(AppRoute.categories, arguments: [
      ImageAsset.plusImage,
      AppRoute.addAdvertisementInfo,
      "chooseTheCategoryOfTheAdvertisement".tr
    ]);
  }
@override
  void onInit() {
   getMyProduct();
  log(myProductsList.length.toString());


    super.onInit();
  }




}
class MyAccountBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => MyAccountControllerImp());
  }

}