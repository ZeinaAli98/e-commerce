
import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchCommonText extends StatelessWidget {
  const SearchCommonText({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: Get.height*0.0284553,

      child: FittedBox(
        child: Text(
          text,textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.textBodyColor),
        ),
      ),
    );
  }
}
