// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:fasateen/lib/ui/global_widgets/the_products_projects.dart';
import 'package:fasateen/lib/ui/product/widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchForProducts extends StatelessWidget {
  const   SearchForProducts({
    super.key,
    required this.isLoading,
    required this.searchList,
    required this.textEditing,
    required this.timer,
  });

  final bool isLoading;
  final List searchList;
  final String textEditing;
  final  timer;

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find<MyServices>();
    return Column(
        children: isLoading
            ? <Widget>[
          const SizedBox(height: 5,),
          Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          ),
        ]
            : [
          if (searchList.isNotEmpty) Expanded(
            child: GridView.builder(
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: Get.height*0.3319783,
                childAspectRatio: 0.7,
              ),
              itemCount: searchList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoute.productPage,
                      arguments: [searchList[index].id]);
                },
                child: Stack(
                    children: [
                      Container(
                        margin:  EdgeInsets.only(left: Get.width*0.0364583),
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
                              searchList[index].imageList.isNotEmpty
                                  ? ImageContainer(
                                image:
                                "https://fasateen.vroad.co${searchList[index].image}",
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
                                        ? searchList[index].arName??""
                                        : searchList[index].enName??"",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  searchList[index].rentPrice > 0
                                      ? TheProductsProjects(
                                    text: 'rent'.tr,
                                    discount: false,
                                  )
                                      : const SizedBox(),
                                  if (searchList[index].price > 0)
                                    TheProductsProjects(
                                      text: 'sale'.tr,
                                      discount: false,
                                    )
                                  else
                                    const SizedBox(),
                                  const Spacer(),
                                  if (searchList[index].discount > 0)
                                    TheProductsProjects(
                                      text: '${searchList[index].discount}'.tr,
                                      discount: true,
                                    )
                                  else
                                    const SizedBox(),
                                ],
                              ),
                              const Spacer(),
                            ]),
                      ),
                      /*FavoriteButton(
                        favorite: favorite,
                      )*/
                    ]),
              ),
            ),
          ) else
            FutureBuilder(
                future: timer,
                builder: (BuildContext context,
                    AsyncSnapshot<String> text) {
                  return textEditing.split("").isNotEmpty
                      ? Center(
                    child: Text(text.data ?? ""),
                  )
                      : const Center(
                    child: Text(
                      "",
                    ),
                  );
                })

        ]);
  }
}
