
import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class StyleModel extends GetxService{
  TextStyle? bodySmall = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontFamily:"Poppins",
  color: AppColor.textBodyColor,
  );
  TextStyle? bodyMedium = TextStyle(
    fontSize: 16,
    fontFamily:"Poppins",
    fontWeight: FontWeight.w400,
    color: AppColor.textBodyColor,
  );
  TextStyle? bodyLarge = TextStyle(
    fontSize: 18,
    fontFamily:"Poppins",
    fontWeight: FontWeight.w400,
    color: AppColor.textBodyColor,
  );
  TextStyle? displaySmall = TextStyle(
    fontSize: 20,
    fontFamily:"Poppins",
    fontWeight: FontWeight.w700,
    color: AppColor.textBodyColorTwo,
  );
  TextStyle? displayMedium = TextStyle(
    fontSize: 22,
    fontFamily:"Poppins",
    fontWeight: FontWeight.w700,
    color: AppColor.textBodyColorTwo,
  );
  TextStyle? displayLarge = TextStyle(
    fontSize: 24,
    fontFamily:"Poppins",
    fontWeight: FontWeight.w700,
    color: AppColor.textHeadColor,
  );



}