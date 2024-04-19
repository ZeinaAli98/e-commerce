
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddColorAndSize extends StatelessWidget {
  const AddColorAndSize({
    super.key, this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        ImageAsset. uploadImageAndVideo,
        height: Get.height*0.0592818,
        width: Get.width*0.1215278,
      ),
    );
  }
}