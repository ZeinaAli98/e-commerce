import 'package:flutter/services.dart';
import '../../../../static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class NumberTextField extends StatelessWidget {
  const NumberTextField({
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
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
          PhoneNumberFormatter(),
        ],
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
              vertical: 0, horizontal: Get.width * 0.05),
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
          hintText: " --- --- --- ",
          alignLabelWithHint: true,
          floatingLabelStyle: TextStyle(color: AppColor.primaryColor),
          suffixIcon: null,
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: Get.width * .005,
              ),
              const Text(
                "  +963  ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}



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
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(9),
          PhoneNumberFormatter(), // Custom formatter for phone number format
        ],
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
              vertical: 0, horizontal: Get.width * 0.12),
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
          hintText: "                              --- --- ---",
          alignLabelWithHint: false,

          floatingLabelStyle: TextStyle(color: AppColor.primaryColor),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: Get.width * .0005,
              ),
              Text(
                "    963+  ",
                style: TextStyle(

                  fontSize: Get.width /22,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"
                ),
              ),
            ],
          ),
          prefixIcon: null,
        ),
      ),
    );

  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: ''); // Handle empty text
    }
    final strippedText = newValue.text.replaceAll(' ', ''); // Remove spaces
    final formattedText = <String>[];

    for (var i = 0; i < strippedText.length; i += 3) {
      final end = i + 3;
      if (end <= strippedText.length) {
        formattedText.add(strippedText.substring(i, end));
      } else {
        formattedText.add(strippedText.substring(i));
      }
    }
    final result = formattedText.join(' ');
    return newValue.copyWith(
      text: result,
      selection: TextSelection.collapsed(offset: result.length),
    );
  }
}