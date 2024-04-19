
import 'package:fasateen/lib/ui/category/categories_controller.dart';
import 'package:fasateen/lib/ui/category/widgets/shimmer_category_card.dart';
import 'package:fasateen/lib/ui/global_widgets/category_box.dart';
import 'package:fasateen/lib/ui/global_widgets/custom_background.dart';
import 'package:fasateen/lib/ui/global_widgets/go_back.dart';
import 'package:fasateen/lib/ui/global_widgets/page_large_description.dart';
import 'package:fasateen/lib/ui/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesPageViewBody extends StatelessWidget {
  const CategoriesPageViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp =
        Get.find<HomePageControllerImp>();

    return Scaffold(
      body: SafeArea(
        child: CustomBackground(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.17,
                child: const GoBack(),
              ),
              LargeTitleAndImage(
                text: Get.arguments[2],
                imageAsset: Get.arguments[0],
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.0388889,
                    vertical: Get.height * 0.0189702),
                height: Get.height * 0.3711043,
                child: GetBuilder(
                  init: CategoriesControllerImp(),
                  builder: (controller) => Wrap(
                    spacing: Get.width * 0.0267361,
                    runSpacing: Get.height * 0.0237127,
                    children: homePageControllerImp.categoriesIsLoading
                        ? const [
                            ShimmerCategoryCard(),
                            ShimmerCategoryCard(),
                            ShimmerCategoryCard(),
                            ShimmerCategoryCard(),
                          ]
                        : List.generate(
                            homePageControllerImp.categoryList.length,
                            (index) => GetBuilder<CategoriesControllerImp>(
                              builder:(controller)=> GestureDetector(
                                  onTapUp: (d) {
                                    controller.onTapUpEvent(index);
                                  },
                                  onTapDown: (d) {
                                    print("hi");
                                    controller.onTapDownEvent(index);
                                  },
                                child: CategoryBox(
                                  borderColor: controller.colorList[index].value,
                                  imageAsset:
                                      "https://fasateen.vroad.co${homePageControllerImp.categoryList[index].image}",
                                  text: controller.language == "ar"
                                      ? homePageControllerImp
                                          .categoryList[index].arName!
                                      : homePageControllerImp
                                          .categoryList[index].enName!,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
