// ignore_for_file: must_be_immutable

import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:fasateen/lib/ui/global_widgets/product_shimmer_effect.dart';
import 'package:fasateen/lib/ui/global_widgets/the_products_projects.dart';
import 'package:fasateen/lib/ui/product/product_controller.dart';
import 'package:fasateen/lib/ui/product/widgets/favorite_button.dart';
import 'package:fasateen/lib/ui/product/widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

class HomeProductCard extends GetView<ProductControllerImp> {
  HomeProductCard({
    super.key,
    required this.productList,
    required this.isLoading,
  });

  final List productList;
  final bool isLoading;
  RxBool favorite = false.obs;

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find<MyServices>();
  //  print("ttttttttttttt"+"${ApiStatic.baseUrl}/public/${productList[0].imageList[1].image}");
    if (isLoading) {
      return Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: Get.width * 0.019444,
          runSpacing: Get.height * 0.0059282,
          children: const [
            ShimmerEffect(),
            ShimmerEffect(),
            ShimmerEffect(),
            ShimmerEffect(),
            ShimmerEffect(),
            ShimmerEffect(),
          ]);
    } else {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.74,
          crossAxisCount: 2,
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Get.toNamed(AppRoute.productPage,
                arguments: [productList[index].id]);
            log(productList[index].id.toString());
            controller.getProductsDetails();
          },
          child: Stack(
              children: [
            Container(
              margin:  EdgeInsets.symmetric(horizontal: Get.width*0.0315972,vertical: Get.height * 0.010833, ),
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.0145833,
                vertical: Get.height * 0.0025833,
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
                    productList[index].imageList.isNotEmpty
                        ? ImageContainer(
                            image:
                                "https://fasateen.vroad.co/store/images/filename_B4giTJkTFGgTe2hJ.png"
                                //"https://fasateen.vroad.co/${productList.}",
                          )
                        : Container(
                            height: Get.height * 0.218157,
                            width: Get.width * 0.418056,
                            decoration: BoxDecoration(
                              color: AppColor.arrowBackground,
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                    const Spacer(),
                    SizedBox(
                      height: Get.height*0.0284553,
                      child: FittedBox(
                        child: Text(
                          myServices.sharedPreferences.getString("lang") == "ar"
                              ? productList[index].arName!
                              : productList[index].enName!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        productList[index].rentPrice! > 0
                            ? TheProductsProjects(
                                text: 'rent'.tr,
                                discount: false,
                              )
                            : const SizedBox(),
                        if (productList[index].price! > 0)
                          TheProductsProjects(
                            text: 'sale'.tr,
                            discount: false,
                          )
                        else
                          const SizedBox(),
                        const Spacer(),
                        if (productList[index].discount! > 0)
                          TheProductsProjects(
                            text: '${productList[index].discount}'.tr,
                            discount: true,
                          )
                        else
                          const SizedBox(),
                      ],
                    ),
                    const Spacer(),
                  ]),
            ),

            FavoriteButton(

              favorite: favorite,
            )
          ]),
        ),
      );
    }
  }
}
