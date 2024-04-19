
import 'package:fasateen/lib/core/api/request.dart';
import 'package:fasateen/lib/core/file_picker/file_picker.dart';
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/static/api.dart';
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:developer';

abstract class SignUpControllerTwo extends GetxController {
  void onChanged(String? value);

  void showDateChange(DateTime selectedDate);

  void stackIndexed();

  sendTheRestOfData();
}

class SignUpControllerTwoImp extends SignUpControllerTwo {
  ApiClientService apiClientService = Get.find<ApiClientService>();

  MyServices myServices = Get.find<MyServices>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Key dropdownButtonFormFieldKey = GlobalKey(debugLabel: "gender");
  Object? dropdownButtonFormFieldValue;

  TextEditingController cityTextEditing = TextEditingController();

  FocusNode myFocusNode = FocusNode();

  final Rx<DateTime> _today = DateTime.now().obs;

  DateTime get today => _today.value;

  set today(value) => _today.value = value;

  final _formatter = "".obs;

  get formatter => _formatter.value;

  set formatter(value) => _formatter.value = value;

  @override
  onChanged(Object? value) {
    dropdownButtonFormFieldValue = value;
  }

  @override
  void showDateChange(DateTime selectedDate) {
    today = selectedDate;
    changeTheFormatter();
  }


  changeTheFormatter() {
    formatter = DateFormat('yyy/MM/dd').format(today);
  }

  void goBack() {
    Get.back();
    changeTheFormatter();
  }

  uploadTheImage() async {
    await FilePickers.filePicker();

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
  }

  @override
  sendTheRestOfData() async {
    dropdownButtonFormFieldValue == "1"
        ? dropdownButtonFormFieldValue = "male"
        : dropdownButtonFormFieldValue = "female";

    var sendTheRestOfDataRequest =
        await apiClientService.postRequest(ApiStatic.editProfile, null, {
      "full_name": myServices.sharedPreferences.getString("fullName"),
      "phone": myServices.sharedPreferences.getString("phone"),
      "w_phone": myServices.sharedPreferences.getString("wPhone"),
      "gender": dropdownButtonFormFieldValue == ""
          ? myServices.sharedPreferences.getString("gender")
          : dropdownButtonFormFieldValue,
      "city": myServices.sharedPreferences.getString("city"),
      "birthdate": myServices.sharedPreferences.getString("barthDate"),
    }, {
      'Accept': 'application/json',
      'Authorization': myServices.sharedPreferences.getString("token")
    });
    if (sendTheRestOfDataRequest != null) {}
  }

  @override
  stackIndexed() async {
    await sendTheRestOfData();
    Get.offAllNamed(AppRoute.indexedStack);
    sendTheRestOfData();
  }
}


class SignUpTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerTwoImp());
  }

}