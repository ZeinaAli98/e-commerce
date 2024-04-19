import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../static/app_color.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade200,
        child: Container(
          width: Get.width*0.274653,
          height: 50,
          decoration: BoxDecoration(
            color: AppColor.whiteBackground,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
