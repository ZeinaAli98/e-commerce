
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProduct extends StatelessWidget {
  const MyProduct({
    super.key,
    required this.number, required this.image,
  });

  final String number;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin:  EdgeInsets.only(
              top:Get.height*0.0035569, bottom: Get.height*0.0035569 / 2, right: Get.width*0.0072917 / 2, left: Get.width*0.0072917 / 2),
          width: Get.width*0.3135417,
          height: Get.height*0.1529472,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(Get.width*0.0194444),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Get.width*0.0194444),//8
            child: Image.network(image,fit: BoxFit.cover,),
          ),
        ),
        Positioned(
          bottom: Get.height*0.0071138,
          right: Get.height*0.0145833,
          child: Container(
            width: Get.width*0.1263889,
            height: Get.height*0.0296409,
            decoration: BoxDecoration(
              color: AppColor.likeBackground,
              borderRadius: BorderRadius.circular(Get.width*0.0121528)//5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(number),
                  SizedBox(
                    width: Get.width*0.0427500,
                    height: Get.height*0.0154133,
                    child: Image.asset(
                      ImageAsset.eyeIcon,
                    ),
                  ),
                ]),
          ),
        )
      ],
    );
  }
}
