
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/ui/authentication/sign_in/widget/login_background.dart';
import 'package:fasateen/lib/ui/authentication/verification/verification_controller.dart';
import 'package:fasateen/lib/ui/authentication/verification/widgets/change_number.dart';
import 'package:fasateen/lib/ui/authentication/verification/widgets/counter_text.dart';
import 'package:fasateen/lib/ui/authentication/verification/widgets/custom_pin_put.dart';
import 'package:fasateen/lib/ui/global_widgets/page_large_description.dart';
import 'package:fasateen/lib/ui/global_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/primary_text_body.dart';

class VerificationBody extends GetView<VerificationControllerImp> {
  const VerificationBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LoginBackground(
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.17,
                ),
                LargeTitleAndImage(
                  text: "enterTheVerificationCode".tr,
                  imageAsset: ImageAsset.verificationImage,
                ),
                PrimaryTextBody(
                  text: "verificationCodeHasBeenSent".tr,
                ),
                SizedBox(
                  height: Get.height *0.0711382,
                ),
                const CustomPinPut(),
                PrimaryButton(
                  onPressed: controller.nextPage,
                  text: "verification".tr,
                  backgroundColor: AppColor.primaryColor,
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColor.textBodyColorTwo),
                ),
                Container(
                    margin: EdgeInsets.only(
                        bottom: Get.height * 0.0177846,
                        top: Get.height * 0.0296409),
                    child: CounterText(
                      onTap: controller.resend,
                    )),
                ChangeNumber(
                  onTap: controller.previsePage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
