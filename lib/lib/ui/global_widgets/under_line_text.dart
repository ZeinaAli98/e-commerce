
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../static/app_color.dart';

class UnderLineText extends StatelessWidget {
  const UnderLineText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Get.height*0.0158138),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            right:0,
            left: 0,
            bottom: 0,


            child: SvgPicture.asset(
              ImageAsset.lineUnderText,

            ),
          ),
          SizedBox(
            height: Get.height*0.0355691,
            child: FittedBox(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge!
                    .copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColor.textHeadColor,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
