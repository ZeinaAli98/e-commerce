

import 'dart:convert';

import 'package:fasateen/lib/core/api/request.dart';
import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart' as colour;
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../static/api.dart';
import '../../static/app_routes.dart';

abstract class AddAdvertisementController extends GetxController {
  onChangedType(Object? value);

  onChangedSaleOrRent(Object? value);

  onChangedCondition(Object? value);

  onChangedFabricType(Object? value);

  onColorChange(Color value);

  void pressOkColor();

  void pressOkNumber();
}

class AddAdvertisementControllerImp extends AddAdvertisementController {



  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ApiClientService apiClientService = Get.find<ApiClientService>();
  Key dropdownButtonFormFieldKeyType = GlobalKey();
  Object? dropdownButtonFormFieldValueType;
  List<DropdownMenuItem<Object>>? itemsType = [
    DropdownMenuItem(
      value: "1",
      child: Text("".tr),
    ),
    DropdownMenuItem(
      value: "2",
      child: Text("".tr),
    ),
  ];

  @override
  void onChangedType(Object? value) {
    dropdownButtonFormFieldValueType = value;
  }

  Key dropdownButtonFormFieldKeySaleOrRent = GlobalKey();
  Object? dropdownButtonFormFieldValueSaleOrRent;
  List<DropdownMenuItem<Object>>? itemsSaleOrRent = [
    DropdownMenuItem(
      value: "1",
      child: Text("".tr),
    ),
    DropdownMenuItem(
      value: "2",
      child: Text("".tr),
    ),
  ];

  List<Widget> numberList = [];

  final _number = 0.obs;
  get number =>_number.value;
  set number(value)=>_number.value = value;



  List<Widget> colorsList = [];


  final _color = AppColor.primaryColor.obs;

  get color => _color.value;

  set color(value) => _color.value = value;



  @override
  void onChangedSaleOrRent(Object? value) {
    dropdownButtonFormFieldValueSaleOrRent = value;
  }

  Key dropdownButtonFormFieldKeyCondition = GlobalKey();
  Object? dropdownButtonFormFieldValueCondition;
  List<DropdownMenuItem<Object>>? itemsCondition = [
    DropdownMenuItem(
      value: "1",
      child: Text("".tr),
    ),
    DropdownMenuItem(
      value: "2",
      child: Text("".tr),
    ),
  ];

  @override
  void onChangedCondition(Object? value) {
    dropdownButtonFormFieldValueCondition = value;
  }

  Key dropdownButtonFormFieldKeyFabricType = GlobalKey();
  Object? dropdownButtonFormFieldValueFabricType;
  List<DropdownMenuItem<Object>>? itemsFabricType = [
    DropdownMenuItem(
      value: "1",
      child: Text("".tr),
    ),
    DropdownMenuItem(
      value: "2",
      child: Text("".tr),
    ),
  ];

  @override
  void onChangedFabricType(Object? value) {
    dropdownButtonFormFieldValueFabricType = value;
  }



  @override
  pressOkNumber() {
    numberList.add(
      Container(
        margin: const EdgeInsets.all(5),
        width: Get.width*0.1215278,
        height: Get.height*0.0592818,
        decoration: BoxDecoration(
          border: Border.all(width: 1,color:AppColor.borderBoxColor),
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

  showNumberDialog() {
    return Get.defaultDialog(
        title: "Pick The Number Please",
        middleText: "",
        content:Obx(
              ()=> NumberPicker(
            axis: Axis.horizontal,
            value: number,
            minValue: 0,
            maxValue: 60,
            onChanged:(value){
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
  onColorChange(Color value) {
    color = value;
  }

  @override
  pressOkColor() {
    colorsList.add(Container(
      margin: const EdgeInsets.all(5),
      width: 50,
      height: 50,
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    ));
    update();
    Get.back();
  }

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


  Future<void> postAdvertisement(Map<String, dynamic> data) async {
    try {
      // Send the base advertisement data
      final response = await apiClientService.postRequest(
        ApiStatic.addProducts,
        null,
        {
        },
        {'Content-Type': 'application/json'},


      );

      if (response != null && response.statusCode == 200) {
        // Advertisement successfully posted
        print('Advertisement posted successfully');
        Get.offNamed(AppRoute.myAccount); // Navigate to the account page
      } else {
        // Advertisement posting failed
        print('Failed to post advertisement - HTTP Status Code: ${response!.statusCode}');
      }

      if (response != null) {
        final parameters = response.data['result']['parameters'];
        if (parameters != null && parameters is List) {
          // Extract the parameters and add them to the data
          final List<Map<String, dynamic>> parametersList = [];

          for (final parameter in parameters) {
            final parameterData = {
              "parameter_id": parameter['parameter_id'],
              "value": parameter['value'],
              // Add other fields from the parameters as needed
            };
            parametersList.add(parameterData);
          }

          // Add the parameters list to your data
          data['parameters'] = parametersList;
        }
      }
    } catch (error) {
      print("error: $error");
    }
    update();
  }



// Future<void> postAdvertisement(Map<String, dynamic> data)  async{
// try{
//   final response= await apiClientService.postRequest(
//
//     ApiStatic.addProducts,
//      null,
//     {"":""
//
//     },
//     {'Content-Type': 'application/json'},
//   );
//   if (response!.statusCode == 200) {
//     // Advertisement successfully posted
//     print('Advertisement posted successfully');
//     Get.offNamed(AppRoute.myAccount);
//   } else {
//     // Advertisement posting failed
//     print('Failed to post advertisement - HTTP Status Code: ${response.statusCode}');
//   }
// }catch(error){
//   print("error: $error");
// }
//
// }

}
class AddAdvertisementBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddAdvertisementControllerImp());
  }
}
