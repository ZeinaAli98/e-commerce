
import 'package:fasateen/lib/core/api/request.dart';
import 'package:fasateen/lib/data/models/favorite_product_model.dart';
import 'package:fasateen/lib/static/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

import '../../core/services/services.dart';

abstract class FavoritePageController extends GetxController {
  void getFavoriteProduct();
  void sendFavoriteData(value);
}

class FavoritePageControllerImp extends FavoritePageController {
  MyServices myServices = Get.find<MyServices>();

  ApiClientService apiClientService = Get.find<ApiClientService>();

  GlobalKey? bottomAppBarKey = GlobalKey();
  int currentBottomBat = 0;
  bool isLoading = true;

  List<Product> favoriteProductList = [];

  @override
  void getFavoriteProduct() async {
    log(myServices.sharedPreferences.getString("token") ?? "");
    var getProducts =
    await apiClientService.getRequest(ApiStatic.getTheFavoriteProduct, {
      "": ""
    }, {
      'Authorization': myServices.sharedPreferences.getString("token"),
    });
    if (getProducts != null) {
      sendFavoriteData(getProducts);
    }
  }

  @override
  sendFavoriteData(value){
    FavoriteProductModel.fromJson(value.data);
    favoriteProductList = FavoriteProductModel.fromJson(value.data).result!;
    isLoading = false;
    update();
  }


  @override
  void onInit() {
    getFavoriteProduct();

    super.onInit();
  }
}

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoritePageControllerImp());
  }
}