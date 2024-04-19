
import 'package:fasateen/lib/static/api.dart';
import 'package:fasateen/lib/ui/notifications/widgets/modern_button.dart';
import 'package:fasateen/lib/ui/notifications/widgets/notification_image_container.dart';
import 'package:fasateen/lib/ui/notifications/widgets/notification_shimmer.dart';
import 'package:get/get.dart';
import '../../../static/app_color.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.isLoading,
    required this.notificationsList,
    this.onTap,
  });

  final bool isLoading;
  final List notificationsList;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: isLoading
          ? const [
              NotificationShimmer(),
              NotificationShimmer(),
              NotificationShimmer(),
              NotificationShimmer(),
              NotificationShimmer(),
            ]
          : notificationsList
              .map(
                (e) => GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: Get.height * 0.0130420),
                    width: Get.width * 0.9333333,
                    height: Get.height * 0.144919,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.borderBoxColor,
                      ),
                      borderRadius: BorderRadius.circular(Get.width*0.0486111),
                    ),
                    child: Row(

                      children: [
                        NotificationImageContainer(
                          image: "${ApiStatic.baseUrl}/${e.image ?? ""}",
                        ),
                        SizedBox(
                          width:4,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Get.height * 0.0130420,
                            ),
                            SizedBox(
                              height: Get.height * 0.0284553,
                              child: FittedBox(child: Text(e.title)),
                            ),
                            SizedBox(
                              height: Get.height * 0.0047425,
                            ),
                            SizedBox(
                              height: Get.height * 0.0284553,
                              width:  Get.width * 0.63333 ,
                              child: Text(
                                e.body,

                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.0042995),
                            Expanded(
                              child: Row(
                                children: [
                                  SizedBox(
                                      height: Get.height * 0.0284553,
                                      child:
                                          FittedBox(child: Text(e.createdAt,maxLines: 3,overflow: TextOverflow.ellipsis,))),
                                  SizedBox(
                                    width: Get.width * 0.2838194,
                                  ),
                                  const ModernButton(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }
}
