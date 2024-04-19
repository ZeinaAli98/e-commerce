
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/ui/authentication/sign_in/login_controller.dart';
import 'package:fasateen/lib/ui/global_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginBottomSheet extends GetView<LoginPageControllerImp> {
  const LoginBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.textBodyColorTwo,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      width: Get.width,
      child: Wrap(children: [Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: Get.width*0.0118564,
              vertical: Get.height*0.0059282,
            ),
            child: Text(
              "".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColor.textBodyColor,),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: Get.width*0.0118564,
              vertical: Get.height*0.0059282,
            ),
            child: Text(
              "willSendCode".tr,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: Get.width*0.0118564,
              vertical: Get.height*0.0059282,
            ),
            child: Text(
              controller.phoneNumberController!.text,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding:  EdgeInsets.symmetric(
                vertical: Get.height*0.0118564,
              ),
              child: PrimaryButton(
                onPressed: controller.goToVerification,
                text: "send".tr,
                backgroundColor: AppColor.primaryColor,
                textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColor.textBodyColorTwo),
              ),
            )
          ]),
        ],
      )],),
    );
  }
}
