import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LargeTitleAndImage extends StatelessWidget {
  const LargeTitleAndImage({
    super.key,
    required this.text,
    required this.imageAsset,
  });

  final String text;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.0723238,
          width: Get.width*.2,
          child: FittedBox(
            child: SvgPicture.asset(imageAsset),
          ),
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
        SizedBox(height: Get.height*0.0284553,child: FittedBox(child: Text(text, style: Theme.of(context).textTheme.displayLarge!))),
        SizedBox(
          height: Get.height * 0.02,
        ),
      ],
    );
  }
}
