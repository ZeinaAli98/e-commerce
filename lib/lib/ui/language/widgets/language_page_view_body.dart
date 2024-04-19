
import 'package:fasateen/lib/core/localization/change_locale.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/ui/global_widgets/custom_background.dart';
import 'package:fasateen/lib/ui/global_widgets/go_back.dart';
import 'package:fasateen/lib/ui/global_widgets/page_discription.dart';
import 'package:fasateen/lib/ui/language/language_controller.dart';
import 'package:fasateen/lib/ui/language/widgets/language_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagePageViewBody extends StatelessWidget {
  const LanguagePageViewBody({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    ChangeLocale changeLocale = Get.find<ChangeLocale>();

    return Scaffold(
      body: SafeArea(
        child: CustomBackground(
          child: SizedBox(
            width: Get.width,
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.17,
                  child: const GoBack(),
                ),
                PageSmallDescription(text: "language".tr,
                  imageAsset: ImageAsset.languageImage,),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                SizedBox(
                  height: Get.height*0.0284553,
                  child: FittedBox(
                    child: Text(
                      "selectYourApplicationLanguage".tr,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                GetBuilder(
                  init: LanguagePageControllerImp(),
                  builder:(controller)=> Column(
                    children: [
                      LanguageBox(
                        onTap: () {
                          Future.delayed(
                            Duration.zero,
                                () {
                              changeLocale.changeLanguage("en");
                            },
                          );
                          controller.groupValue = "en";
                        },
                        text: "english".tr,
                        isClicked: controller.groupValue == "en" ? true : false,
                        value: "en",
                        groupValue: controller.groupValue,
                        onChanged: controller.onChanged,
                      ),
                      LanguageBox(
                        onTap: () {
                          Future.delayed(
                            Duration.zero,
                                () {
                              changeLocale.changeLanguage("ar");
                            },
                          );
                          controller.groupValue = "ar";
                        },
                        text: "arabic".tr,
                        isClicked: controller.groupValue == "ar" ? true : false,
                        value: "ar",
                        groupValue: controller.groupValue,
                        onChanged: controller.onChanged,
                      ),
                    ],
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
