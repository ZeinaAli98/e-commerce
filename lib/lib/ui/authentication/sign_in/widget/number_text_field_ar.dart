
import '../../../../static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberTextFieldAr extends StatelessWidget {
  const NumberTextFieldAr({
    super.key,
    this.labelText,
    this.labelStyle,
    this.validator,
    this.contrroller,
    this.onChanged,
    this.colored,
  });

  final String? labelText;
  final bool? colored;
  final String? Function(String?)? validator;
  final TextStyle? labelStyle;
  final TextEditingController? contrroller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Get.height * 0.0237127),
      width: Get.width * 0.921,
      child: TextFormField(
        cursorColor:AppColor.primaryColor,
        textDirection: TextDirection.ltr,
        validator: validator,
        controller: contrroller,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1,
              color: colored == true
                  ? AppColor.primaryColor
                  : AppColor.borderBoxColor,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
              vertical: 0, horizontal: Get.width * 0.0121528),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColor.primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText,
          hintText: "--- --- ---",
          floatingLabelStyle: TextStyle(color: AppColor.primaryColor),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Get.height * 0.0154133,
                horizontal: Get.width * 0.0145833),
            child: const Text(
              "+963",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          prefixIcon: null
        ),
      ),
    );

  }
}
