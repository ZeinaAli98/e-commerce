// ignore: must_be_immutable

import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../authentication/sign_in/login_controller.dart';

class PrimaryTextField extends StatelessWidget {
  PrimaryTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.textInputType,
    this.labelText,
    this.labelStyle,
    this.readOnly = false,
    this.onChanged,
    this.validator,
    this.controller,
    this.obscureText,
    this.iconData,
    this.onTapIcon
  });

  final bool readOnly;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? labelStyle;
  final TextInputType? textInputType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final IconData? iconData;
  final void Function()? onTapIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(bottom: Get.height*0.0237127),
      width: Get.width*0.921,
      child: TextFormField(

        cursorColor:AppColor.primaryColor,
        readOnly: readOnly,
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        keyboardType: textInputType,
        obscureText:obscureText == null || obscureText== false? false : true,
        decoration: InputDecoration(
          contentPadding:  EdgeInsets.symmetric(vertical:Get.height*0.0177846,horizontal: Get.width*0.0243056),
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
          isDense: true,
          floatingLabelStyle:  TextStyle(color: AppColor.primaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText,
          labelStyle: labelStyle,
          suffixIconConstraints:
          BoxConstraints(minHeight: Get.height*0.0284553, minWidth: Get.width*0.0510417),
          suffixIcon: Padding(padding:const EdgeInsetsDirectional.only(end: 12.0),child:
          InkWell(onTap: onTapIcon,child:obscureText== true || obscureText==null ?
          Icon(Icons.visibility_outlined,color: AppColor.pseudoGrey,):
          Icon(Icons.visibility_off_outlined,color: AppColor.primaryColor,),),),
          prefixIcon: const Text(""),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 16, letterSpacing: 1.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 1),
          ),
        ),
      ),
    );
  }
}




class NameTextField extends StatelessWidget {
  NameTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.textInputType,
    this.labelText,
    this.labelStyle,
    this.readOnly = false,
    this.onChanged,
    this.validator,
    this.controller,
    this.obscureText,
    this.iconData,
    this.onTapIcon, this.enable=true
  });

  final bool readOnly;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? labelStyle;
  final TextInputType? textInputType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final bool enable;
  final IconData? iconData;
  final void Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(bottom: Get.height*0.0237127),
      width: Get.width*0.921,
      child: TextFormField(
        enabled: enable,
        cursorColor:AppColor.primaryColor,
        readOnly: readOnly,
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        keyboardType: textInputType,
        obscureText:obscureText??false,
        decoration: InputDecoration(
          contentPadding:  EdgeInsets.symmetric(vertical:Get.height*0.0177846,horizontal: Get.width*0.0243056),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColor.primaryColor),
          ),
          disabledBorder: OutlineInputBorder(
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

          isDense: true,
          floatingLabelStyle:  TextStyle(color: AppColor.primaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText,
          labelStyle: labelStyle,
          suffixIconConstraints:
          BoxConstraints(minHeight: Get.height*0.0284553, minWidth: Get.width*0.0510417),
          suffixIcon: suffixIcon,
          prefixIcon: const Text(""),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 16, letterSpacing: 1.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 1),
          ),
        ),
      ),
    );
  }
}
