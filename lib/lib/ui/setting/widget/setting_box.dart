
import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SettingBox extends StatelessWidget {
  const SettingBox({
    super.key, required this.text, required this.imageAsset, this.onTap, this.color,
  });
  final String text ;
  final String imageAsset ;
  final void Function()? onTap ;
  final Color ? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin:  EdgeInsets.symmetric(vertical:  Get.height*0.009485,),
        width: Get.width*0.923611,
        height: Get.height*0.080623,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColor.borderBoxColor),
        ),
        child: Row(
          children: [
            SizedBox(width: Get.width*0.024306,),
            SizedBox(width: 40,height: 32,child: SvgPicture.asset(imageAsset)),
            SizedBox(width: Get.width*0.024306,),
            SizedBox(height: Get.height*0.0284553,child: FittedBox(child: Text(text,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: Get.width),)))
          ],
        ),
      ),
    );
  }
}
