import 'package:fasateen/lib/static/app_color.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class NotificationShimmer extends StatelessWidget {
  const NotificationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7.5),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade100,
        highlightColor: Colors.grey.shade200,
        child: Container(
          width: Get.width*0.9236111,
          height: Get.height*0.1185637,
          decoration: BoxDecoration(
            color: AppColor.whiteBackground,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}