import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertAgreeCondition() {
  Get.defaultDialog(
      title: "",
      titleStyle: TextStyle(fontSize: Get.width*0.002),
      barrierDismissible: false,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
         children: [
         Container(
         padding: EdgeInsets.symmetric(vertical: Get.height *0.005),
         child: Image.asset("assets/images/alert.jpg",
         height: Get.width * 0.19, width: Get.width * 0.19,
         ),
         ),
         SizedBox(height: Get.height *0.01,),
         Text("Please agree to the terms and conditions policy",
         style:TextStyle(fontSize: Get.width * 0.035,fontWeight: FontWeight.w500) ,)

     ],
   ),
       actions: [
         MaterialButton(
           shape: OutlineInputBorder(
               borderRadius: BorderRadius.circular(10),
               borderSide: BorderSide(
                 color: AppColor.primaryColor,
               )),

           onPressed: () {
             Get.back();
           },
           child: Text(
             "Confirm",
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
           "Cancel",
           style: TextStyle(
           color: AppColor.textBodyColorTwo,
        ),
      ),
    ),
  ]);
  return Future.value(bool as FutureOr<bool>?);
}