import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LargeDescriptionAndNetworkImage extends StatelessWidget {
  const LargeDescriptionAndNetworkImage({
    super.key,
    this.text,
    this.imageAsset,
  });

  final String? text;
  final String? imageAsset;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: SizedBox(
            width: Get.width*0.1482639,
            height: Get.height*0.0723238,
            child: Image.network(imageAsset ?? "", fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
        Text(text ?? "", style: Theme.of(context).textTheme.displayLarge!),
        SizedBox(
          height: Get.height * 0.02,
        ),
      ],
    );
  }
}
