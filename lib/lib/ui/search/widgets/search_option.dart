
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/ui/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchOption extends GetView<SearchPageControllerImp> {
  const SearchOption({
    super.key,
    required this.text,
    required this.option,
    required this.onTap,
  });

  final String text;
  final bool option;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Container(
          margin: EdgeInsets.zero,
          width: Get.width / 2,
          color: AppColor.whiteBackground,
          child: Text(
            text,
            style: option
                ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColor.primaryColor, fontWeight: FontWeight.w700)
                : Theme.of(context).textTheme.bodyMedium!,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: EdgeInsets.zero,
          color: Colors.white,
          height: Get.height*0.0094851,
          width: Get.width/2,
        ),
        Container(
          margin: EdgeInsets.zero,
          width: Get.width / 2,
          height: 2,
          color: option ? AppColor.primaryColor : AppColor.borderBoxColor,
        ),
      ]),
    );
  }
}