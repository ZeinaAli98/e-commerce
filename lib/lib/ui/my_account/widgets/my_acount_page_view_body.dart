
import 'package:fasateen/lib/core/services/services.dart';
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

class MyAccountPageViewBody extends GetView<MyAccountControllerImp> {
  MyAccountPageViewBody({super.key});
  MyServices myServices = Get.put(MyServices());
  SellersAccountControllerImp sellersAccountController= Get.put(SellersAccountControllerImp());
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
                  SizedBox(
                    height: Get.height * 0.0071138,
                  ),
                  const AccountHeader(),
                  SizedBox(
                    height: Get.height * 0.0284553,
                  ),
                  SizedBox(
                    height: Get.height * 0.1102642,
                    child: GetBuilder(
                      init: MyAccountControllerImp(),
                      builder: (controller) => UserDetails(
                        productText: "product".tr,
                        productsNumber:
                        controller.myProductsList.length.toString(),
                        visitorsText: 'visitor'.tr,
                        visitorsNumber:sellersAccountController.mySeller.length.toString(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.0237127,
                  ),
                  UnderLineText(text: myServices.sharedPreferences.getString("fullName") ??
                      "User"),
                  SizedBox(
                    height: Get.height * 0.0201558,
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
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.0145833,
                      vertical: Get.height * 0.0071138),
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: controller.isMyProductLoading
                          ? []
                          : controller.myProductsList.map(
                            (e) {
                          return MyProduct(
                            number: e.views.toString(),
                            image:
                            "https://fasateen.vroad.co${e.category.image}",
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ),
            ),
            PrimaryButtonWithIcon(
              onPressed: controller.postAnNewAdd,
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

