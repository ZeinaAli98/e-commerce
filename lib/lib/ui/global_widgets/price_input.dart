
import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceInput extends StatelessWidget {
  const PriceInput({
    super.key,
    this.text,
    this.controller,
    this.width,
    this.height,
  });

  final String? text;
  final TextEditingController? controller;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width * 0.4399306,
      height: height ?? Get.height * 0.0663957,
      child: TextField(
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: text ?? "",
          suffixIcon: Column(
            children: [
              const Spacer(
              ),
              Text(
                "s.p".tr,
              ),
              const Spacer(),
            ],
          ),
          isDense: true,
          floatingLabelStyle: TextStyle(color: AppColor.primaryColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColor.primaryColor),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColor.borderBoxColor,
              ),
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
