
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/ui/category_pill_page/category_page_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPillBackButton extends GetView<CategoryPillPageControllerImp> {
  const CategoryPillBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.ltr,
      child: Column(children: [
        SizedBox(
          height: Get.height*0.007114,
        ),
        Row(
          children: [
            SizedBox(
              width: Get.width*0.041319,
            ),
            GestureDetector(
              onTap: () {
                controller.categoryId=0;
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical:  Get.width * 0.02056),
                padding: EdgeInsets.symmetric(
                  vertical: Get.height * 0.0094851,
                  horizontal: Get.width * 0.0243056,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColor.arrowBackground,
                ),
                child: SvgPicture.asset(
                  ImageAsset.backIcon,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
