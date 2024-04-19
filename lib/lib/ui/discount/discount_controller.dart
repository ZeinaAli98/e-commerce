
import 'package:fasateen/lib/core/api/request.dart';
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/data/models/discount_model.dart';
import 'package:fasateen/lib/static/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

abstract class DiscountPageController extends GetxController{
  void getDiscountProduct();
  void getDiscountProducts(value);
}
class DiscountPageControllerImp extends DiscountPageController{

  ApiClientService apiClientService = Get.find<ApiClientService>();
  MyServices myServices = Get.find<MyServices>();
  DiscountProductModel discountProductModel = DiscountProductModel();

  GlobalKey? bottomAppBarKey = GlobalKey();
  int currentBottomBat = 0;

  List<DiscountProductModel> discountProductsList = [];
  bool isLoading = true;


  @override
  void getDiscountProduct() async {
    log(myServices.sharedPreferences.getString("token") ?? "");
    var getProducts = await apiClientService
        .postRequest(ApiStatic.getTheProductDiscount, null, {
      "":""
    }, {
      'Accept': 'application/json',
      'Authorization':  myServices.sharedPreferences.getString("token"),
    });
    if (getProducts != null) {
      getDiscountProducts(getProducts);
    }
  }
  @override
  getDiscountProducts(value){
    var responseData = value.data["result"]["products"];
    discountProductModel.fromJsonArray(responseData);
    discountProductsList = discountProductModel.fromJsonArray(responseData);
    isLoading = false;
    update();
  }
  @override
  void onInit() {
    getDiscountProduct();

    super.onInit();
  }


}

class DiscountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiscountPageControllerImp());
  }
}