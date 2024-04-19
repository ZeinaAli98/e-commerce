
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height,
        width: Get.width,
        color: AppColor.whiteBackground,
      child: Stack(
        children: [

          Column(
            children: [
              SizedBox(height: Get.height*0.17,),
              SizedBox(
                child: SvgPicture.asset(ImageAsset.authBackgroundLine),
              ),
            ],
          ),
          child,
        ],
      ),
    );
  }
}
