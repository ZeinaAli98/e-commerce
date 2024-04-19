// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fasateen/lib/core/api/request.dart';
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/data/models/home_product_model.dart';
import 'package:fasateen/lib/data/models/seller.dart';
import 'package:fasateen/lib/static/api.dart';
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SearchPageController extends GetxController {
  void changeOptionStatus();

  void goToCategories();

  void onChange(value);

  bool isLoading();

  void getProducts();

  void getSellers();
}

class SearchPageControllerImp extends SearchPageController {
  MyServices myServices = Get.find<MyServices>();

  ApiClientService apiClientService = ApiClientService();

  ProductModel productModel = ProductModel();

  SellerModel sellerModel = SellerModel();


  String textEditing = "";

  final Rx<bool> _searchOption = false.obs;

  get searchOption => _searchOption.value;

  set searchOption(value) => _searchOption.value = value;

  final Rx<bool> _productsOption = false.obs;

  get productsOption => _productsOption.value;

  set productsOption(value) => _productsOption.value = value;

  final Rx<bool> _advertisersOption = true.obs;

  get advertisersOption => _advertisersOption.value;

  set advertisersOption(value) => _advertisersOption.value = value;



  List<SellerModel> searchSellersList = [];
  List<ProductModel> searchProductsList = [];

  int currentIndex = 0;

  PageController? pageController = PageController();


  @override
  void changeOptionStatus() {
    advertisersOption = !advertisersOption;
    if (advertisersOption == true) {
      currentIndex = 0;
      pageController!.animateToPage(
          currentIndex, duration: const Duration(milliseconds: 300),
          curve: Curves.linear);
      update();
    }
    productsOption = !productsOption;
    if (productsOption == true) {
      currentIndex = 1;
      pageController!.animateToPage(
          currentIndex, duration: const Duration(milliseconds: 300),
          curve: Curves.linear);
      update();
    }
  }

  @override
  void onChange(value) {
    textEditing = value;
    if (textEditing
        .split("")
        .length >= 3) {
      getProducts();
      getSellers();
      searchOption = true;
      update();
    }
    if (textEditing
        .split("")
        .length < 3) {
      searchProductsList.clear();
      searchSellersList.clear();
      searchOption = false;
      update();
    }

    update();
  }

  @override
  void goToCategories() {
    Get.toNamed(
      AppRoute.categories,
      arguments: [
        ImageAsset.filterIcon,
        AppRoute.searchWithFilter,
        "selectItems".tr,
      ],
    );
  }


  @override
  bool isLoading() {
    return textEditing
        .split("")
        .length < 3 && textEditing
        .split("")
        .isNotEmpty
        ? true
        : false;
  }

  String? imageUrl = "";

  @override
  void getProducts() async {
    timer = Future.delayed(const Duration(microseconds: 1), () {
      return "";
    });
    var getProducts =
    await apiClientService.postRequest(ApiStatic.getTheProduct, null, {
      "sort_type": "desc",
      "search_query": textEditing,
    }, {
      'Accept': 'application/json',
      'Authorization': myServices.sharedPreferences.getString("token"),
    });
    if (getProducts != null) {
      var responseData = getProducts.data["result"]["products"];
      productModel.fromJsonArray(responseData);
      searchProductsList = productModel.fromJsonArray(responseData);
      timer = Future.delayed(const Duration(microseconds: 1), () {
        return "There is no Result";
      });
      print(searchProductsList.length.toString());
      update();
    }
  }


  @override
  void getSellers() async {
    timer = Future.delayed(const Duration(microseconds: 1), () {
      return "";
    });
    var getProducts = await apiClientService.getRequest(
      ApiStatic.getMySeller,
      {"page": "0"},
      {
        'Accept': 'application/json',
        'Authorization': myServices.sharedPreferences.getString("token"),
      },
    );
    if (getProducts != null) {
      var responseData = getProducts.data["result"];
      sellerModel.jsonArray(responseData);
      searchSellersList = sellerModel.jsonArray(responseData);
      timer = Future.delayed(const Duration(microseconds: 1), () {
        return "There is no Result";
      });
      print(searchSellersList.length.toString());
      update();
    }
  }

  var timer = Future.delayed(const Duration(microseconds: 1), () {
    return "";
  });

  @override
  void onInit() {
    getSellers();
    getProducts();
    super.onInit();
  }
}

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchPageControllerImp());
  }
}