
import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPageText extends StatelessWidget {
  const UserPageText({
    super.key,
    required this.number,
    required this.text,
  });

  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height*0.0984079,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: Get.height*0.0284553,
            child: FittedBox(
              child: Text(
                number,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: AppColor.primaryColor),
              ),
            ),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColor.textBodyColor, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}