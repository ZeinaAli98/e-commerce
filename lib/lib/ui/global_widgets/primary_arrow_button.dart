
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        margin: EdgeInsets.only(top: Get.height*0.0059282),
        padding: EdgeInsets.symmetric(
          vertical: Get.height * 0.004851,
          horizontal: Get.width * 0.0143056,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColor.arrowBackground,
        ),
        child: SvgPicture.asset(
          ImageAsset.backIcon,
        ),
      ),
    );
  }
}
