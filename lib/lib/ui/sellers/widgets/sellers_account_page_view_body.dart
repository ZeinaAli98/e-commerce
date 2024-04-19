
import 'package:fasateen/lib/static/api.dart';
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/ui/global_widgets/under_line_text.dart';
import 'package:fasateen/lib/ui/my_account/my_account_controller.dart';
import 'package:fasateen/lib/ui/my_account/widgets/my_account_header.dart';
import 'package:fasateen/lib/ui/my_account/widgets/primary_buttoon_with_icon.dart';
import 'package:fasateen/lib/ui/my_account/widgets/show_like_widget.dart';
import 'package:fasateen/lib/ui/my_account/widgets/user_details.dart';
import 'package:fasateen/lib/ui/sellers/sellers_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellersAccountPageViewBody extends GetView<SellersAccountControllerImp> {
   SellersAccountPageViewBody({super.key});
  SellersAccountControllerImp controllerImp=Get.find<SellersAccountControllerImp>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColor.whiteBackground,
              child: Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  const AccountHeader(),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 93,
                    child: GetBuilder(
                      init: SellersAccountControllerImp(),
                      builder: (controller) => UserDetails(
                        productText: 'product'.tr,
                        productsNumber:
                            controller.customersProductsList.length.toString(),
                        visitorsText: 'visitor'.tr,
                        visitorsNumber: "100",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  UnderLineText(text:"" ),
                  const SizedBox(
                    height: 17,
                  ),
                ],
              ),
            ),
            GetBuilder(
              init: MyAccountControllerImp(),
              builder: (controller) => Expanded(
                child: Container(
                  width: Get.width,
                  color: AppColor.primaryBackgroundColor,
                  padding: const EdgeInsets.all(6.5),
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: controller.isMyProductLoading
                          ? []
                          : controller.myProductsList.map(
                              (e) {
                                return MyProduct(
                                  number: e.views.toString(),
                                  image:
                                      "${ApiStatic.baseUrl}/public/${e.category.image}",
                                );
                              },
                            ).toList(),
                    ),
                  ),
                ),
              ),
            ),
            PrimaryButtonWithIcon(
              onPressed: () {
            //....app rout ...add advertisement.....
              },
              backgroundColor: AppColor.primaryColor,
              color: AppColor.borderBoxColorTwo,
              icon: ImageAsset.plusIcon,
            )
          ],
        ),
      ),
    );
  }
}
