import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PageSmallDescription extends StatelessWidget {
  const PageSmallDescription({
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
        SizedBox(width: Get.width*0.2697917,height: Get.height*0.1316057,child: FittedBox(child: SvgPicture.asset(imageAsset))),
        SizedBox(
          height: Get.height * 0.012,
        ),
        SizedBox(
          height: Get.height*0.0284553,
          child: FittedBox(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.012,
        ),
      ],
    );
  }
}
