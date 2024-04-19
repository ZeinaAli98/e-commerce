import 'dart:developer';


import 'package:fasateen/lib/core/api/request.dart';
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/data/models/product_detials_model.dart';
import 'package:get/get.dart';

import '../../static/api.dart';

abstract class ProductController extends GetxController {
  getProductsDetails();
  //sendProductsDetailData(result);

  addToFavorite() ;
  deleteFromFavorite() ;
}

class ProductControllerImp extends ProductController {

  ApiClientService apiClientService = Get.find<ApiClientService>();
  MyServices myServices = Get.find<MyServices>();
  ProductsDetails productsDetails = ProductsDetails();
  bool Loading = true;
  List<ProductsDetails> productsDetailsList= [];
  RxBool favourite = false.obs;
 final Product? product=Product();
  @override
  void getProductsDetails()async {
 print("  loading:${Loading}");
    log(myServices.sharedPreferences.getString("token") ?? "");
     var getDetails = await apiClientService.getRequest("${ApiStatic.getTheProductDetails}/8", {"": ""},
        {"Authorization": myServices.sharedPreferences.getString("token")});
    Loading= false;

     productsDetails= ProductsDetails.fromJson(getDetails.data);
 print("  loading2:${Loading}");



  }


  @override
  addToFavorite() async{

   await apiClientService.postRequest(

      ApiStatic.addToFavorite,
      null,
     {"productId": product!.id.toString()},
      {'Authorization': myServices.sharedPreferences.getString("token")},
    );
   favourite=true.obs;
   update();
  }
  @override
  deleteFromFavorite()async {
  await  apiClientService.postRequest(
      ApiStatic.deleteFromFavorite,
      null,
    {"productId": product!.id.toString()} ,
      {'Authorization': myServices.sharedPreferences.getString("token")},
    );
  favourite=false.obs;
    update();
  }
  @override
  void onInit() {
    getProductsDetails();

      super.onInit();
  }



}
class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProductControllerImp());
  }

}