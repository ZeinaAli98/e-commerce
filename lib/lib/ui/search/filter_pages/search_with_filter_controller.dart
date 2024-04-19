
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart' as colour;
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

abstract class SearchWithFilterController extends GetxController {
  void pressOkNumber();

  void onColorChange(value);

  showNumberDialog();

  void pressOkColor();

  showColorDialog();

  void goToAfterSearch();

  onChangeSaleValue(value);
  onChangeRentValue(value);
  onChangeNewValue(value);
  onChangeUseValue(value);

  format();
}

class SearchWithFilterControllerImp extends SearchWithFilterController {
  List<Widget> numberList = [];

  final _number = 0.obs;

  get number => _number.value;

  set number(value) => _number.value = value;

  List<Widget> colorsList = [];

  final _color = AppColor.primaryColor.obs;

  get color => _color.value;

  set color(value) => _color.value = value;

  TextEditingController dropController = TextEditingController();
  TextEditingController priceFrom = TextEditingController();
  TextEditingController priceTo = TextEditingController();


  bool saleValue = false;
  bool rentValue = false;
  bool newValue = false;
  bool useValue = false;
  String filtering="";


  @override
  onChangeSaleValue(value){
    saleValue = value;
    update();
  }
  @override
  onChangeRentValue(value){
    rentValue = value;
    update();
  }
  @override
  onChangeNewValue(value){
    newValue = value;
    update();
  }

  @override
  onChangeUseValue(value){
    useValue = value;
    update();
  }
  @override
  onChangeFilterValue(value){
    filtering = value;
    update();
  }

  @override
  format ()  {
    dropController.clear();
    numberList.clear();
    colorsList.clear();
    saleValue = false;
    rentValue=false;
    newValue=false;
    useValue=false;
    filtering="";
    priceFrom.clear();
    priceTo.clear();

    update();
  }

  @override
  pressOkNumber() {
    numberList.add(
      Container(
        margin:  EdgeInsets.symmetric(horizontal: Get.width*0.0243056),
        width: Get.width*0.1215278,
        height: Get.height*0.0592818,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Center(child: Text("$number")),
      ),
    );
    update();
    Get.back();
  }

  @override
  showNumberDialog() {
    return Get.defaultDialog(
        title: "Pick The Number Please",
        middleText: "",
        content: Obx(
          () => NumberPicker(
            axis: Axis.horizontal,
            value: number,
            minValue: 0,
            maxValue: 60,
            onChanged: (value) {
              number = value;
            },
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
            ),
            onPressed: pressOkNumber,
            child: const Text(
              "Ok",
            ),
          ),
        ]);
  }

  @override
  onColorChange(value) {
    color = value;
  }

  @override
  pressOkColor() {
    colorsList.add(Container(
      margin:  EdgeInsets.symmetric(horizontal: Get.width*0.0243056),
      width: Get.width*0.1215278,
      height: Get.height*0.0592818,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    ));
    update();
    Get.back();
  }

  @override
  showColorDialog() {
    return Get.defaultDialog(
        title: "Pick The Color Please",
        middleText: "",
        content: colour.ColorPicker(
          pickerColor: color,
          onColorChanged: onColorChange,
        ),
        actions: [
          Obx(
            () => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
              ),
              onPressed: pressOkColor,
              child: const Text(
                "Ok",
              ),
            ),
          ),
        ]);
  }

  @override
  void goToAfterSearch() {
    Get.toNamed(AppRoute.afterSearchingWithFilter);
  }
}


class SearchWithFilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchWithFilterControllerImp());
  }
}