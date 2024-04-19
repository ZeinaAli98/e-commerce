// ignore_for_file: non_constant_identifier_names


import 'package:fasateen/lib/core/api/request.dart';
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/data/models/home_product_model.dart';
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CategoryPillPageController extends GetxController {
  void searching();

  void TextFieldOnChange(value);

  void setCategoryValue(int value);

  void getProductWithId(categoryId);

  void sendModelData(responseData);

  void goToSearchPage();
}

class CategoryPillPageControllerImp extends CategoryPillPageController {
  MyServices myServices = Get.find<MyServices>();
  ApiClientService apiClientService = ApiClientService();
  ProductModel productModel = ProductModel();

  final Rx<int> _categoryId = 0.obs;

  get categoryId => _categoryId.value;

  set categoryId(value) => _categoryId.value = value;

  TextEditingController searchBarWithIconController = TextEditingController();
  List categoryProductsList = [];
  List filteredList = [];
  bool categoriesIsLoading = false;

  bool isLoading = true;

  String TextFieldValue = "";

  String language = "";


  final Rx<String> _title = "".obs;
  get title => _title.value;
  set title(value) => _title.value=value;




  @override
  void searching() {
    language = myServices.sharedPreferences.getString("lang") ?? "";
    filteredList = categoryProductsList
        .where((item) =>
    language == "ar"
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
  void setCategoryValue(int value) {
    categoryId = value;
    getProductWithId(value);
    update();
  }


  @override
  void getProductWithId(categoryId) async {
    var getProducts = await apiClientService.postRequest(
      "api/product/$categoryId",
      null,
      {
        "sort_column": "date",
        "sort_type": "desc",
      },
      {
        'Accept': 'application/json',
        'Authorization': myServices.sharedPreferences.getString("token"),
      },
    );
    if (getProducts != null) {
      sendModelData(getProducts);
    }
  }

  @override
  void sendModelData(responseData) {
    var data = responseData.data["result"]["products"];
    productModel.fromJsonArray(data);
    categoryProductsList = productModel.fromJsonArray(data);
    isLoading = false;
    update();
  }

  @override
  void goToSearchPage() {
    Get.toNamed(AppRoute.search);
  }
}
class CategoryPillPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryPillPageControllerImp());
  }

}