
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../filter_pages/search_with_filter_controller.dart';

class Format extends GetView<SearchWithFilterControllerImp> {
  const Format({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.format,
      child: Container(
        margin: EdgeInsets.only(
            right: Get.width * 0.0413194, top: Get.height * 0.015569),
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.0340278),
        width: Get.width * 0.3086806,
        height: Get.height * 0.0592818,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Get.width * 0.0315972),
          border: Border.all(
            color: AppColor.borderBoxColorTwo,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "format".tr,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(
                width: Get.width * 0.0486111,
                height: Get.height * 0.0237127,
                child: SvgPicture.asset(ImageAsset.returnValues)),
          ],
        ),
      ),
    );
  }
}
