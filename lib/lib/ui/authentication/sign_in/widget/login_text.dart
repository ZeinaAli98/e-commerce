
import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginText extends StatelessWidget {
  const LoginText({
    super.key, required this.text, this.onTap,
  });
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: Get.height*0.0355691,
        child: FittedBox(
          child: Text(
            text,textAlign:TextAlign.center,
            style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins"
            ),
          ),
        ),
      ),
    );
  }
}