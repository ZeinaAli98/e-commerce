
import 'package:fasateen/lib/ui/category_pill_page/category_page_controller.dart';
import 'package:fasateen/lib/ui/category_pill_page/widgets/category_up_part.dart';
import 'package:fasateen/lib/ui/global_widgets/background_with_stars.dart';
import 'package:fasateen/lib/ui/global_widgets/search_bar_with_icon.dart';
import 'package:fasateen/lib/ui/home/home_controller.dart';
import 'package:fasateen/lib/ui/home/widgets/category_pill.dart';
import 'package:fasateen/lib/ui/product/widgets/home_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPillPageViewBody extends GetView<CategoryPillPageControllerImp> {
  const CategoryPillPageViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp =
        Get.find<HomePageControllerImp>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          Obx(
            ()=> CategoryUpPart(
              text: controller.title,
            ),
          ),
          BackgroundWithStars(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.017785,
                ),
                SearchBarWithIcon(
                  onChanged: controller.TextFieldOnChange,
                  onTap: controller.goToSearchPage,
                  controller: controller.searchBarWithIconController,
                ),
                SizedBox(
                  height: Get.height * 0.017785,
                ),
                Container(
                  padding: EdgeInsets.only(right: Get.width * 0.041319),
                  height: Get.height * 0.059282,
                  child: GetBuilder<CategoryPillPageControllerImp>(
                    builder: (controller) => CategoryPill(
                      categoriesIsLoading: controller.categoriesIsLoading,
                      categoryList: homePageControllerImp.categoryList,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.017785,
                ),
                Expanded(
                  child: GetBuilder<CategoryPillPageControllerImp>(
                    builder: (controller) => HomeProductCard(
                      productList: controller
                                  .searchBarWithIconController.text ==
                              ""
                          ? controller.categoryProductsList
                          : controller.filteredList,
                      isLoading: controller.isLoading,
                    ),
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
