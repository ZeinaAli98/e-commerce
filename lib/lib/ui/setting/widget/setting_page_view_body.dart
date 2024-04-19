
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/ui/global_widgets/custom_background.dart';
import 'package:fasateen/lib/ui/global_widgets/page_large_description.dart';
import 'package:fasateen/lib/ui/global_widgets/up_section.dart';
import 'package:fasateen/lib/ui/setting/setting_controller.dart';
import 'package:fasateen/lib/ui/setting/widget/deteing_bottom_sheet.dart';
import 'package:fasateen/lib/ui/setting/widget/setting_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SettingPageViewBody extends GetView<SettingPageControllerImp> {
  const SettingPageViewBody({
    super.key, });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CustomBackground(
          child: SizedBox(
            width: Get.width,
            child: Column(
              children: [
                const UpSection(),
                LargeTitleAndImage(
                  text: "setting".tr,
                  imageAsset: ImageAsset.settingImage,
                ),
                SettingBox(
                  onTap: controller.language,
                  text: "language".tr,
                  imageAsset: ImageAsset.languageImage,
                ),
                SettingBox(
                  onTap:controller.contactUs,
                  text: "connectWithUs".tr,
                  imageAsset: ImageAsset.connectWithUsImage,
                ),
                SettingBox(
                  onTap: controller.privacyPolicy,
                  text: "privacyPolicy".tr,
                  imageAsset: ImageAsset.privacyPolicyImage,
                ),
                SettingBox(
                  onTap: controller.termsAndCondition,
                  text: "termsAndConditions".tr,
                  imageAsset: ImageAsset.termsAndConditionsImage,
                ),
                SettingBox(
                  onTap: controller.logOut,
                  text: "LogOut".tr,
                  imageAsset: ImageAsset.logout,
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Container(
                  margin:  EdgeInsets.symmetric(horizontal: Get.width*0.0486111),
                  width: Get.width*0.9236111,
                  child: GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        const DeletingBottomSheet(),
                      );
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                          SizedBox(
                            height: Get.height*0.0225271,
                            child: FittedBox(
                              child: Text(
                                "deleteAccount".tr,
                                textAlign: TextAlign.start,
                                style: TextStyle(color: AppColor.deleteColor,fontWeight: FontWeight.w700,fontSize: 16),
                              ),
                            ),
                          ),]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

