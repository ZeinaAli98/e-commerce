// ignore_for_file: non_constant_identifier_names


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/data/models/category_model.dart';
import 'package:fasateen/lib/data/models/home_product_model.dart';
import 'package:fasateen/lib/static/api.dart';
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'dart:io';

import '../../core/api/request.dart';

abstract class HomePageController extends GetxController {

  void searching();

  void goToSearchPage();

  void TextFieldOnChange(value);

  void checkConnectToTheInternet();

  void getProducts();

  void sendProductsData(value);

  void getCategories();

  void sendCategoriesData(apiResponse);

  void addToFavorite();

  void deleteFromFavorite();
}

class HomePageControllerImp extends HomePageController {
  GlobalKey? bottomAppBarKey = GlobalKey();
  ApiClientService apiClientService = Get.find<ApiClientService>();
  MyServices myServices = Get.find<MyServices>();

  ProductModel productModel = ProductModel();

  TextEditingController searchBarWithIconController = TextEditingController();

  List filteredList = [];

  String? language;

  String TextFieldValue = "";

  List productList = [];
  int currentBottomBat = 0;
  bool isLoading = true;
  String? imageUrl = "";
  bool categoriesIsLoading = false;



  List<CategoryModel> categoryList = [];


  @override
  void searching() {
    language = myServices.sharedPreferences.getString("lang");
    filteredList = productList
        .where((item) => language == "ar"
            ? item.arName!.startsWith(TextFieldValue)
            : item.enName!.startsWith(TextFieldValue))
        .toList();
    update();
  }

  @override
  void TextFieldOnChange(value) {
    TextFieldValue = value;
    update();
    searching();
  }


  @override
  void goToSearchPage() {
    Get.toNamed(AppRoute.search);
  }


  @override
  void getProducts() async {
    log(myServices.sharedPreferences.getString("token") ?? "");
    var getProducts =
        await apiClientService.postRequest(ApiStatic.getTheProduct, null, {
      "sort_column": "date",
      "sort_type": "desc",
    }, {
      'Accept': 'application/json',
      'Authorization': myServices.sharedPreferences.getString("token"),
    });
    if (getProducts != null) {
 sendProductsData(getProducts);
    }
  }
@override
  void sendProductsData(value){
  var responseData = value.data["result"]["products"];
  productModel.fromJsonArray(responseData);
  productList = productModel.fromJsonArray(responseData);
  isLoading = false;
//  update();
}

  @override
  void getCategories() async {
    var apiResponse = await apiClientService.getRequest(ApiStatic.categoryApi, {
      "": ""
    }, {
      'Authorization': myServices.sharedPreferences.getString("token"),
    });

    if (apiResponse != null) {
      sendCategoriesData(apiResponse);
    }
  }

  @override
  void sendCategoriesData(apiResponse) {
    CategoryModel.fromJson(apiResponse.data);
    categoryList = CategoryModel.fromJsonArray(apiResponse.data);
    categoriesIsLoading = false;
  update();
  }

  late ConnectivityResult internetStatus;

  @override
  void checkConnectToTheInternet() async {
    internetStatus = await (Connectivity().checkConnectivity());
    if (internetStatus == ConnectivityResult.none) {
      return Get.defaultDialog(
          title: "Alert",
          middleText: "There is no internet",
          actions: [
            TextButton(
              onPressed: () {
                exit(0);
              },
              child: const Text("Close Fassaten"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  shape: const BeveledRectangleBorder()),
              onPressed: () {},
              child: const Text("Retry"),
            ),
          ]);
    }
  }

  @override
  addToFavorite() {
    apiClientService.postRequest(
      ApiStatic.addToFavorite,
      null,
      null,
      {'Authorization': myServices.sharedPreferences.getString("token")},
    );
  }

  @override
  deleteFromFavorite() {
    apiClientService.postRequest(
      ApiStatic.deleteFromFavorite,
      null,
      null,
      {'Authorization': myServices.sharedPreferences.getString("token")},
    );
    update();
  }

  @override
  void onInit() {
    checkConnectToTheInternet();
    getCategories();

    super.onInit();
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageControllerImp());
  }
}