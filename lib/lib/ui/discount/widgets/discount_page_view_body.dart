
import 'package:fasateen/lib/ui/discount/discount_controller.dart';
import 'package:fasateen/lib/ui/global_widgets/background_with_stars.dart';
import 'package:fasateen/lib/ui/global_widgets/under_line_text.dart';
import 'package:fasateen/lib/ui/global_widgets/up_section.dart';
import 'package:fasateen/lib/ui/product/widgets/home_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscountPageViewBody extends StatelessWidget {
  const DiscountPageViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const UpSection(),
            BackgroundWithStars(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.0413194,
                    ),
                    child: UnderLineText(text: "discounts".tr),
                  ),
                  GetBuilder(
                    init: DiscountPageControllerImp(),
                    builder: (controller) => Expanded(
                      child: HomeProductCard(
                        productList: controller.discountProductsList,
                        isLoading: controller.isLoading,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
