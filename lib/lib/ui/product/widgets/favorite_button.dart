
import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../static/image_asset.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.favorite,
  });

  final Rx<bool> favorite;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Get.height*0.0142276,
      right: Get.width * 0.0267361,
      child: GestureDetector(
        onTap: () {
          favorite.value = !favorite.value;
        },
        child: Container(
          margin:   EdgeInsets.symmetric(horizontal: Get.width * 0.0194444,vertical: Get.height * 0.0059282),
          padding:  EdgeInsets.symmetric(
              horizontal: Get.width*0.017014, vertical: Get.height*0.009485),
          decoration: BoxDecoration(
            color: AppColor.likeBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: Get.width*0.053472,
            height: Get.height*0.023713,
            child: Obx(
                  () => SvgPicture.asset(
                favorite.value
                    ? ImageAsset.activeLikeButton
                    : ImageAsset.likeButton,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
