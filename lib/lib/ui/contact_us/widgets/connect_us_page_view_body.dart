
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/ui/global_widgets/custom_background.dart';
import 'package:fasateen/lib/ui/global_widgets/go_back.dart';
import 'package:fasateen/lib/ui/global_widgets/page_discription.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ConnectUsPageViewBody extends StatelessWidget {
  const ConnectUsPageViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomBackground(
            child: SizedBox(
              width: Get.height,
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.17,
                    child: const GoBack(),
                  ),
                  PageSmallDescription(text: "connectWithUs".tr,
                    imageAsset: ImageAsset.connectWithUsImage,),
                  SizedBox(
                    height: Get.height * 0.035,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(ImageAsset.emailIcon),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      SvgPicture.asset(ImageAsset.whatsappIcon),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      SvgPicture.asset(ImageAsset.facebookIcon),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      SvgPicture.asset(ImageAsset.instagramIcon),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  SizedBox(
                    height: Get.height*0.0284553,
                    child: FittedBox(
                      child: Text(
                        "aboutTheApplication".tr,
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColor.textBodyColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
