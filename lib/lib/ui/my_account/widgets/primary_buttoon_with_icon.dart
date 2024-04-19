
import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryButtonWithIcon extends StatelessWidget {
  const PrimaryButtonWithIcon({
    super.key,
    this.onPressed,
    required this.backgroundColor,
    required this.color,
    required this.icon,
  });

  final void Function()? onPressed;
  final Color backgroundColor;
  final Color color;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: Get.height * 0.0130420,
          bottom: Get.height * 0.0225271,
          right: Get.width * 0.0413194,
          left: Get.width * 0.0413194),
      height: Get.height*0.0924797,
      width: Get.width,
      color: AppColor.whiteBackground,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(width: Get.width*0.0340278, height: Get.height*0.0165989, child: SvgPicture.asset(icon)),
           SizedBox(
            width: Get.width*0.0243056,
          ),
          Text(
            "postANewAd".tr,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColor.textBodyColorTwo),
          ),
        ]),
      ),
    );
  }
}
