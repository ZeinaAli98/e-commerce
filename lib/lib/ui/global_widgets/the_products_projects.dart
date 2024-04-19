
import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TheProductsProjects extends StatelessWidget {
  const TheProductsProjects(
      {super.key, required this.text, required this.discount});

  final String text;
  final bool discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: Get.height*0.005928),
      width: Get.width*0.099653,
      height: Get.height*0.023713,
      decoration: BoxDecoration(
        color: discount ? AppColor.discountColor : AppColor.arrowBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: SizedBox(
          height: Get.height*0.0284553,
          child: FittedBox(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: discount ? FontWeight.w700 : FontWeight.w400,
                  color: discount
                      ? AppColor.textBodyColorTwo
                      : AppColor.textBodyColor),
            ),
          ),
        ),
      ),
    );
  }
}
