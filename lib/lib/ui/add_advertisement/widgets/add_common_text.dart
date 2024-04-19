import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../static/app_color.dart';

class AddCommonText extends StatelessWidget {
  const AddCommonText({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: Get.height*0.0284553,
          child: FittedBox(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: AppColor.textBodyColor),
            ),
          ),
        ),
      ],
    );
  }
}
