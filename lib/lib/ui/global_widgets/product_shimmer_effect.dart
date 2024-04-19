import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width*0.4472222,
      height: Get.height*0.3023374,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey.shade300,
              child: Container(
                width: Get.width*0.4472222,
                height: Get.height*0.2264566,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(13)),
              ),
            ),
             SizedBox(
              height: Get.height*0.0118564,
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey.shade300,
              child: Container(
                width: Get.width*0.4131944,
                height: Get.height*0.0284553,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(13)),
              ),
            ),
             SizedBox(
              height: Get.height*0.0118564,
            ),
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    width: Get.width*0.1944444,
                    height: Get.height*0.0118564,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(13)),
                  ),
                ),
                 SizedBox(
                  width: Get.height*0.0118564,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    width: Get.width*0.1944444,
                    height: Get.height*0.0237127,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(13)),
                  ),
                ),
              ],
            )
          ]),
    );
  }
}
