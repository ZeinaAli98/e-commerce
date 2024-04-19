
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/ui/global_widgets/custom_background.dart';
import 'package:fasateen/lib/ui/global_widgets/go_back.dart';
import 'package:fasateen/lib/ui/notifications/notifcation_controller.dart';
import 'package:fasateen/lib/ui/notifications/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/page_discription.dart';

class NotificationsPageViewBody extends StatelessWidget {
  const NotificationsPageViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomBackground(
          child: Column(children: [
            SizedBox(
              height: Get.height * 0.17,
              child: const GoBack(),
            ),
            PageSmallDescription(
              text: "notifications".tr,
              imageAsset: ImageAsset.notificationImage,
            ),
            GetBuilder(
              init: NotificationControllerImp(),
              builder: (controller) => Expanded(
                child: Container(
                  margin:  EdgeInsets.symmetric(horizontal: Get.width*0.0364583),
                  child: NotificationCard(
                    onTap:(){

                    },
                    isLoading: controller.isLoading,
                    notificationsList: controller.notificationsList,
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
