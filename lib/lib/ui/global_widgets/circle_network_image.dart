

import 'package:fasateen/lib/core/services/services.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CircleNetWorkImage extends StatelessWidget {
  const CircleNetWorkImage({
    super.key, required this.width, required this.height,
  });
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find<MyServices>();
    return SizedBox(
      width: width,
      height:height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          myServices.sharedPreferences.getString("image") ?? "",
          errorBuilder: (context, error, stackTrace) =>
           SvgPicture.asset(ImageAsset.avatar),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
