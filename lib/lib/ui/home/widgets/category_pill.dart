
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/static/api.dart';
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:fasateen/lib/ui/category_pill_page/category_page_controller.dart';
import 'package:fasateen/lib/ui/home/home_controller.dart';
import 'package:fasateen/lib/ui/home/widgets/category_shimmer.dart';

import '../../../static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPill extends GetView<HomePageControllerImp> {
  const CategoryPill({
    super.key,
    required this.categoriesIsLoading,
    required this.categoryList,
    this.value,
  });

  final bool categoriesIsLoading;
  final List categoryList;
  final String? value;

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find<MyServices>();

    CategoryPillPageControllerImp categoryPillPageControllerImp =
       Get.put(CategoryPillPageControllerImp());

    if (categoriesIsLoading) {
      return ListView(scrollDirection: Axis.horizontal, children: const [
        CategoryCard(),
        CategoryCard(),
        CategoryCard(),
        CategoryCard(),
      ]);
    } else {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            categoryPillPageControllerImp
                .setCategoryValue(categoryList[index].id);
            Get.toNamed(
                AppRoute.categoryPill);
            categoryPillPageControllerImp.title=
              myServices.sharedPreferences.getString("lang") == "ar"
                ? categoryList[index].arName
                : categoryList[index].enName;

          },
          child: Obx(
            () => Container(
              margin: EdgeInsets.only(right: Get.width * 0.0243056),
              constraints: BoxConstraints(maxWidth: Get.width * 0.33),
              decoration: BoxDecoration(
                color: categoryPillPageControllerImp.categoryId ==
                        categoryList[index].id
                    ? AppColor.primaryColor
                    : AppColor.whiteBackground,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: Get.height * 0.0047425,
                      top: Get.height * 0.0047425,
                      right: Get.width * 0.0097222,
                      left: Get.width * 0.0097222,
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "${ApiStatic.baseUrl}/public/${categoryList[index].image}"),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: Get.width * 0.1336806,
                    height: Get.height * 0.0284553,
                    child: FittedBox(
                      child: Text(
                        myServices.sharedPreferences.getString("lang") == "ar"
                            ? categoryList[index].arName!
                            : categoryList[index].enName!,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: categoryPillPageControllerImp.categoryId ==
                                      categoryList[index].id
                                  ? AppColor.textBodyColorTwo
                                  : AppColor.textHeadColor,
                            ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
