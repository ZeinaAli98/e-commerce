

import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/ui/setting/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeletingBottomSheet extends GetView<SettingPageControllerImp> {
  const DeletingBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration:  BoxDecoration(
      color: AppColor.whiteBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(
            15,
          ),
        ),
      ),
      child: Wrap(
        children:[ Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: Get.width*0.0243056,
                vertical: Get.height*0.0059282,
              ),
              child: Text(
                "areYouSureYouWantToDeleteYourAccount".tr,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: AppColor.textBodyColor),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: Get.width*0.0243056,
                vertical: Get.height*0.0059282,
              ),
              child: Text(
                "deletingTheAccountLeadsToLosingAllYourAdsAndData".tr,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding:  EdgeInsets.symmetric(
                  vertical: Get.height*0.0118564,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize:  Size(Get.width*0.9236111, Get.height*0.0592818),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: controller.deleteAccount,
                  child: Text(
                    "delete".tr,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColor.textBodyColorTwo,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding:  EdgeInsets.symmetric(
                  vertical: Get.height*0.0118564,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.whiteBackground,
                    fixedSize: Size(Get.width*0.9236111, Get.height*0.0592818),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "cancel".tr,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              )
            ]),
          ],
        ),]
      ),
    );
  }
}
