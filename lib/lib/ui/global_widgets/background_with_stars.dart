
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackgroundWithStars extends StatelessWidget {
  const BackgroundWithStars({
    super.key, required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            color: AppColor.homePageBackground,
            width: Get.width,
            child:  Column(
              children: [
                const Spacer(),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(ImageAsset.rightStar),
                    ],
                  ),
                ),
                const Spacer(flex: 2,),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    SvgPicture.asset(ImageAsset.leftStar,
                        alignment: Alignment.centerRight)
                  ]),
                ),
                const Spacer(),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}
