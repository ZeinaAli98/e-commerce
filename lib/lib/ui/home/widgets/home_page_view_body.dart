
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:fasateen/lib/ui/global_widgets/background_with_stars.dart';
import 'package:fasateen/lib/ui/global_widgets/search_bar_with_icon.dart';
import 'package:fasateen/lib/ui/global_widgets/under_line_text.dart';
import 'package:fasateen/lib/ui/global_widgets/up_section.dart';
import 'package:fasateen/lib/ui/home/home_controller.dart';
import 'package:fasateen/lib/ui/home/widgets/category_pill.dart';
import 'package:fasateen/lib/ui/home/widgets/event_box.dart';
import 'package:fasateen/lib/ui/product/widgets/home_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageViewBody extends GetView<HomePageControllerImp> {
  const HomePageViewBody({
    super.key,
  });

  void openEven(){
    Get.toNamed(AppRoute.eventPageView);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          const UpSection(),
          BackgroundWithStars(
            child: Column(
              children: [
                 SizedBox(
                  height: Get.height*0.017785,
                ),
                SearchBarWithIcon(
                  onChanged: controller.TextFieldOnChange,
                  onTap: controller.goToSearchPage,
                  controller: controller.searchBarWithIconController,
                ),
                 SizedBox(
                  height: Get.height*0.017785,
                ),
                Container(
                  padding:  EdgeInsets.only(right: Get.width*0.041319),
                  height: Get.height*0.059282,
                  child: GetBuilder<HomePageControllerImp>(
                    builder: (controller) => CategoryPill(
                      categoriesIsLoading: controller.categoriesIsLoading,
                      categoryList: controller.categoryList,
                    ),
                  ),
                ),
                 SizedBox(
                  height: Get.height*0.017785,
                ),
                 EventBox(function: openEven,),
                 SizedBox(
                  height: Get.height*0.017785,
                ),
                Expanded(
                  child: Container(
                    margin:  EdgeInsets.symmetric(
                      horizontal: Get.width*0.041319,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UnderLineText(
                            text: "theMostRecent".tr,
                          ),
                          GetBuilder<HomePageControllerImp>(
                            builder: (controller) => Expanded(
                              child: HomeProductCard(
                                productList: controller
                                            .searchBarWithIconController.text ==
                                        ""
                                    ? controller.productList
                                    : controller.filteredList,
                                isLoading: controller.isLoading,
                              ),
                            ),
                            ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
