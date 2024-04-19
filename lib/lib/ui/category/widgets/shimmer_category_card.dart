import 'package:fasateen/lib/static/app_color.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategoryCard extends StatelessWidget {
  const ShimmerCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      child: Container(
        width: Get.width*0.4472222,
        height: Get.height*0.1707317,
        decoration: BoxDecoration(
          color: AppColor.whiteBackground,
          borderRadius: BorderRadius.circular(
            24,
          ),
        ),
      ),
    );
  }
}
