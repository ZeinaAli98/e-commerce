// ignore_for_file: must_be_immutable
import 'dart:developer';


import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/ui/global_widgets/product_shimmer_effect.dart';
import 'package:fasateen/lib/ui/global_widgets/the_products_projects.dart';
import 'package:fasateen/lib/ui/product/product_controller.dart';
import 'package:fasateen/lib/ui/product/widgets/image_container.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteProductCard extends GetView<ProductControllerImp> {
  FavoriteProductCard({
    super.key,
    required this.favoriteProductList,
    required this.isLoading,
  });

  final List favoriteProductList;
  final bool isLoading;

  final List<bool> favorites = List.generate(100, (index) => false);


  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find<MyServices>();
    Get.put(ProductControllerImp());


    return isLoading
        ? Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: Get.width * 0.0194444,
        runSpacing: Get.height * 0.0177846,
        children: const [
          ShimmerEffect(),
          ShimmerEffect(),
          ShimmerEffect(),
          ShimmerEffect(),
          ShimmerEffect(),
          ShimmerEffect(),
        ])
        : GridView.builder(
         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
         childAspectRatio: 0.7,
         crossAxisCount: 2,
      ),
         itemCount: favoriteProductList.length,
         itemBuilder: (context, index) =>
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoute.productPage,
                  arguments: [favoriteProductList[index].id]);
              log(favoriteProductList[index].id.toString());
              controller.getProductsDetails();
              // print("rrrrrrrrrrr${[favoriteProductList[index].id]}");
            },
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Get.width * 0.0194444),
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.0145833,
                    vertical: Get.height * 0.0145833,
                  ),
                  height: Get.height * 0.3123374,
                  width: Get.width * 0.447222,
                  decoration: BoxDecoration(
                    color: AppColor.whiteBackground,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageContainer(
                          image:
                          "https://fasateen.vroad.co${favoriteProductList[index]
                              .category.image}",
                        ),
                        const Spacer(),
                        SizedBox(
                          height: Get.height * 0.0284553,
                          child: FittedBox(
                            child: Text(
                              myServices.sharedPreferences
                                  .getString("lang") ==
                                  "ar"
                                  ? favoriteProductList[index].arName!
                                  : favoriteProductList[index].enName!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            favoriteProductList[index].rentPrice! > 0
                                ? TheProductsProjects(
                              text: 'rent'.tr,
                              discount: false,
                            )
                                : const SizedBox(),
                            if (favoriteProductList[index].price! > 0)
                              TheProductsProjects(
                                text: 'sale'.tr,
                                discount: false,
                              )
                            else
                              const SizedBox(),
                            const Spacer(),
                            if (favoriteProductList[index].discount! > 0)
                              TheProductsProjects(
                                text: '${favoriteProductList[index].discount}'
                                    .tr,
                                discount: true,
                              )
                            else
                              const SizedBox(),
                          ],
                        ),
                        const Spacer(),
                      ]),
                ),
                Positioned(
                  top: Get.height * 0.0142276,
                  right: Get.width * 0.0267361,
                  child:
                      GestureDetector(
                      onTap: () {
                        toggleFavorite(index);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.0097222,
                            vertical: Get.height * 0.0059282),
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.0170139,
                            vertical: Get.height * 0.0094851),
                        decoration: BoxDecoration(
                          color: AppColor.likeBackground,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          width: Get.width * 0.0534722,
                          height: Get.height * 0.0237127,
                          child: SvgPicture.asset(
                            favorites[index]
                                ? ImageAsset.activeLikeButton
                                : ImageAsset.likeButton,
                            key: ValueKey<bool>(favorites[index]),
                          ),
                        ),
                      ),
                    ),

                ),
              ],
            ),
          ),
    );
  }
  void toggleFavorite(int index)async {
    if (favorites[index]) {
      // If already a favorite, remove it from the favorite list
   await   controller.deleteFromFavorite();
      favorites[index] = false;
    } else {
      // If not a favorite, add it to the favorite list
   await   controller.addToFavorite();
      favorites[index] = true;
    }
    // Toggle the favorite status for the specific product
    favorites[index] = !favorites[index];
  }
}


