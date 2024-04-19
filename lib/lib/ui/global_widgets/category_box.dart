
import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    super.key,
    required this.imageAsset,
    required this.text,
    this.borderColor,
  });

  final String imageAsset;
  final Color? borderColor;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.4472222,
      height: Get.height * 0.1707317,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? AppColor.borderBoxColor),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              width: Get.width * 0.1458333,
              height: Get.height * 0.0711382,
              child: Image.network(imageAsset,
                  errorBuilder: (context, error, stackTrace) => const Center(
                        child: Text("hello"),
                      ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: Get.height * 0.0118564,
          ),
          SizedBox(
            height: Get.height * 0.0284553,
            child: FittedBox(
              child: Text(
                text,
              ),
            ),
          )
        ],
      ),
    );
  }
}
