
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/ui/global_widgets/custom_background.dart';
import 'package:fasateen/lib/ui/global_widgets/go_back.dart';
import 'package:fasateen/lib/ui/global_widgets/page_discription.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsBody extends StatelessWidget {
  const TermsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomBackground(
          child: SizedBox(
            width: Get.width,
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.17,
                  child:const GoBack(),
                ),
                PageSmallDescription(text: "termsAndConditions".tr,
                  imageAsset: ImageAsset.termsAndConditionsImage,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
