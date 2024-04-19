
import 'package:fasateen/lib/ui/favorite/favorite_controller.dart';
import 'package:fasateen/lib/ui/global_widgets/background_with_stars.dart';
import 'package:fasateen/lib/ui/global_widgets/under_line_text.dart';
import 'package:fasateen/lib/ui/global_widgets/up_section.dart';
import 'package:fasateen/lib/ui/product/widgets/favorite_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePageViewBody extends StatelessWidget {
   FavoritePageViewBody({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UpSection(),
            BackgroundWithStars(
              child: Container(
                margin:  EdgeInsets.symmetric(horizontal: Get.width*0.0413194,vertical: Get.height*0.0201558),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    UnderLineText(text: "favoriteList".tr),
                    GetBuilder<FavoritePageControllerImp>(
                      init: FavoritePageControllerImp(),
                      builder: (controller) => Expanded(
                        child: FavoriteProductCard(
                          favoriteProductList: controller.favoriteProductList,
                          isLoading: controller.isLoading,

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
