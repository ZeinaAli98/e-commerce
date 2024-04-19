import 'dart:developer';

import 'package:fasateen/lib/core/api/request.dart';
import 'package:fasateen/lib/core/file_picker/file_picker.dart';
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/data/models/my_product_model.dart';
import 'package:fasateen/lib/static/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart ' as dio;

abstract class EditMyAccountController extends GetxController {
  String? nameValidation(firstName);

  changeTheFormatter();

  void goBack();

  void showDateChange(DateTime selectedDate);

  editInfo();

  onChanged(Object? value);
}

class EditMyAccountControllerImp extends EditMyAccountController {
  ApiClientService apiClientService = Get.find<ApiClientService>();

  MyServices myServices = Get.find<MyServices>();

  MyProductModel myProductModel = MyProductModel();
  FilePickers filePickers = FilePickers();

  TextEditingController phoneController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController wPhoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  final Rx<DateTime> _today = DateTime.now().obs;
  final _formatter = "".obs;
  final gender ="".obs;

  @override
  String? nameValidation( firstName) {
    if (firstName != null) {
      return "Invalid Name";
    }
    return null;
  }



  DateTime get today => _today.value;

  set today(value) => _today.value = value;

  @override
  void showDateChange(DateTime selectedDate) {
    today = selectedDate;
    changeTheFormatter();
  }





  get formatter => _formatter.value;

  set formatter(value) => _formatter.value = value;

  @override
  void changeTheFormatter() {
    _formatter.value = DateFormat('yyyy/MM/dd').format(_today.value);
    birthController.text = _formatter.value;
  }

  @override
  void goBack() {
    Get.back();

  }

  uploadTheImage() async {
    await FilePickers.filePicker();


  }

  dio.FormData formDataTwo = dio.FormData();



  @override
  editInfo() async {

  final formDataTwo = dio.FormData.fromMap({
      'image': await dio.MultipartFile.fromFile(
        FilePickers.filePath,
        filename: FilePickers.fileName,
      ),
    'phone': phoneController.text,
    'password': '123123',
    'w_phone': wPhoneController.text,
    'full_name': fullNameController.text,
    'gender': gender.value,
    'city': cityController.text,
    'birthdate': birthController.text
    });

    try {
      var uploadTheImageRequest = await apiClientService
          .postRequest(ApiStatic.uploadImage, null, FilePickers.formData, {
        'Accept': 'application/json',
        'Authorization': myServices.sharedPreferences.getString("token")
      });
      if (uploadTheImageRequest != null) {
        myServices.sharedPreferences.setString("image",
            "https://fasateen.vroad.co${uploadTheImageRequest.data["url"]}");
        log(myServices.sharedPreferences.getString("image") ?? "");
      }

      final response = await apiClientService.postRequest(
        ApiStatic.editProfile,
        null,
        formDataTwo,
        {
          'Accept': 'application/json',
          'Authorization': myServices.sharedPreferences.getString("token"),
        },
      );

      if (response != null) {
        myServices.sharedPreferences.setString('fullName', fullNameController.text);
        myServices.sharedPreferences.setString('phone', phoneController.text);
        myServices.sharedPreferences.setString('w_phone', wPhoneController.text);
        myServices.sharedPreferences.setString('city', cityController.text);
        myServices.sharedPreferences.setString('birth', birthController.text);
        myServices.sharedPreferences.setString('gender', gender.value);
        myServices.sharedPreferences.setString('image', dio.MultipartFile.fromFile(
          FilePickers.filePath,
          filename: FilePickers.fileName,
        ).toString());

        print('Profile updated successfully');
      } else {

        print('Failed to update profile');
      }
    } catch (error) {

      print('Error: $error');
    }


    update();
  }

  Key dropdownButtonFormFieldKey = GlobalKey(
    debugLabel: "gender",
  );

  Object?   dropdownButtonFormFieldValue;

  @override
  onChanged(Object? value) {
    gender.value = value.toString();

  }

  @override
  void onInit() {
    phoneController.text = myServices.sharedPreferences.getString("phone") ?? "";
    fullNameController.text = myServices.sharedPreferences.getString("fullName") ?? "";
    wPhoneController.text = myServices.sharedPreferences.getString("w_phone") ?? "";
    cityController.text = myServices.sharedPreferences.getString("city") ?? "";
    birthController.text = myServices.sharedPreferences.getString("birth") ?? "";
    gender.value = myServices.sharedPreferences.getString("gender") ?? "";
    changeTheFormatter(); // You might want to ensure that the date formatter is initialized.
    super.onInit();
  }
}
class EditMyAccountBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => EditMyAccountControllerImp());
  }

}