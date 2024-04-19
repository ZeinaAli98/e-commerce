import 'dart:async';
import 'dart:io';


import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(title: "Fasateen", middleText: "Are you sure", actions: [
    MaterialButton(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColor.primaryColor,
          )),

      onPressed: () {
        exit(0);
      },
      child: Text(
        "Yes",
        style: TextStyle(
          color: AppColor.primaryColor,
        ),
      ),
    ),
    MaterialButton(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColor.primaryColor,
          )),
      color: AppColor.primaryColor,
      onPressed: () {
        Get.back();
      },
      child: Text(
        "NO",
        style: TextStyle(
          color: AppColor.textBodyColorTwo,
        ),
      ),
    ),
  ]);
  return Future.value(bool as FutureOr<bool>?);
}
