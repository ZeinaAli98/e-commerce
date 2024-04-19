import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../static/image_asset.dart';

class AddVideoOrPicture extends StatelessWidget {
  const AddVideoOrPicture({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(
            ImageAsset.uploadImageAndVideo,
            height: Get.height * 0.1399051,
            width: Get.width * 0.2868056,
          ),
        ),
      ],
    );
  }
}
