
import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../static/image_asset.dart';

class PersonalPhoto extends StatelessWidget {
  const PersonalPhoto({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SvgPicture.asset(
        ImageAsset.smailFace,
        width: Get.width*0.1555556,
        height: Get.height*0.0758808,
      ),
      SizedBox(
        width: Get.width * 0.03,
      ),
      GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: Get.height*0.0284553,
          child: FittedBox(
            child: Text(
              "yourPersonalPhoto".tr,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColor.termsAndConditions),
            ),
          ),
        ),
      ),
    ]);
  }
}
