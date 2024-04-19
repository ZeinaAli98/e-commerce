
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/ui/global_widgets/go_back.dart';
import 'package:fasateen/lib/ui/search/search_controller.dart';
import 'package:fasateen/lib/ui/search/widgets/search_bar_with_border.dart';
import 'package:fasateen/lib/ui/search/widgets/search_for_card.dart';
import 'package:fasateen/lib/ui/search/widgets/search_for_seller.dart';
import 'package:fasateen/lib/ui/search/widgets/search_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPageViewBody extends GetView<SearchPageControllerImp> {
  const SearchPageViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColor.whiteBackground,
              height: Get.height*0.0972222,
              width: Get.width,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GoBack(),
                     SizedBox(
                      width: Get.width*0.0364583,
                    ),
                    SearchBarWithBorder(
                      onChanged: controller.onChange,
                      onTap: controller.goToCategories,
                    ),
                  ],
                ),
              ),
            ),

            Obx(
              () => controller.searchOption
                  ? Padding(

                    padding:EdgeInsets.symmetric(vertical: 10),
                    child: Row(

                        children: [
                          SearchOption(
                            text: "advertisers".tr,
                            option: controller.advertisersOption,
                            onTap: controller.changeOptionStatus,
                          ),
                          SearchOption(
                            text: "products".tr,
                            option: controller.productsOption,
                            onTap: controller.changeOptionStatus,
                          ),
                        ],
                      ),
                  )
                  : Container(),
            ),
            // SizedBox(height: Get.height*0.0177846),
            GetBuilder<SearchPageControllerImp>(
              builder: (controller) => Expanded(
                child: PageView(
                    controller: controller.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                  SearchForSellers(
                    searchList: controller.searchSellersList,
                    textEditing: controller.textEditing,
                    timer: controller.timer,
                    isLoading: controller.isLoading(),
                  ),
                  SearchForProducts(
                    isLoading: controller.isLoading(),
                    searchList: controller.searchProductsList,
                    textEditing: controller.textEditing,
                    timer: controller.timer,
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
