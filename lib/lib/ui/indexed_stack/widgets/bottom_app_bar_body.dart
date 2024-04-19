
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/ui/indexed_stack/indexed_stack_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppBarBody extends GetView<IndexedStackControllerImp> {
  const BottomAppBarBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexedStackControllerImp>(

      builder:(controller)=> SizedBox(
        height: Get.height*0.0711382,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: BottomAppBar(
            key: controller.bottomAppBarKey,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: controller.firstIndex,
                  child: controller.firstCondition()
                      ? SvgPicture.asset(
                      ImageAsset.activeHomePageIcon
                  )
                      : SvgPicture.asset(
                    ImageAsset.homePageIcon,
                  ),
                ),
                GestureDetector(
                  onTap: controller.secondIndex,
                  child: controller.secondCondition()
                      ? SvgPicture.asset(ImageAsset.activeDiscountPageIcon)
                      : SvgPicture.asset(
                    ImageAsset.discountPageIcon,
                  ),
                ),
                GestureDetector(
                  onTap: controller.thirdIndex,
                  child: controller.thirdCondition()
                      ? SvgPicture.asset(ImageAsset.activeFavoritePageIcon)
                      : SvgPicture.asset(
                    ImageAsset.favoritePageIcon,
                  ),
                ),
                GestureDetector(
                  onTap: controller.fourthIndex,
                  child: controller.fourthCondition()
                      ? SvgPicture.asset(ImageAsset.activeSettingPageIcon)
                      : SvgPicture.asset(
                    ImageAsset.settingIcon,
                  ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
