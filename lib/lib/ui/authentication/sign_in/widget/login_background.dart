
import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../static/image_asset.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height,
          width: Get.width,
          color: AppColor.primaryBackgroundColor,
        ),
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
    );
  }
}
