
import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/app_routes.dart';
import 'package:fasateen/lib/ui/global_widgets/circle_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import '../../static/image_asset.dart';
import 'package:get/get.dart';
import 'under_line_text.dart';

class UpSection extends StatelessWidget {
  const UpSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find<MyServices>();
    return Container(
      color: AppColor.whiteBackground,
      height: Get.height * 0.097222,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: Get.width * 0.043750,
                ),
                Column(children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.myAccount);
                    },
                    child: CircleNetWorkImage(
                      width: Get.width * 0.097222,
                      height: Get.height * 0.047425,
                    ),
                  ),
                  const Spacer(),
                ]),
                SizedBox(
                  width: Get.width * 0.019444,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      height: Get.height*0.0213415,
                      child: FittedBox(fit: BoxFit.cover,
                        child: Text(
                          "welcome".tr,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height*0.0284553,
                      child: FittedBox(
                        child: UnderLineText(
                          text:
                              myServices.sharedPreferences.getString("fullName") ??
                                  "User",
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                )
              ],
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: Get.width * 0.058333,
              height: Get.height * 0.028455,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoute.notifications);
                },
                child: SvgPicture.asset(ImageAsset.notificationIcon),
              ),
            ),
          ]),
          SizedBox(
            width: Get.width * 0.04,
          )
        ],
      ),
    );
  }
}
