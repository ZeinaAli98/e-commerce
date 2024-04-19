
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchBarWithBorder extends StatelessWidget {
  const SearchBarWithBorder({
    super.key,
    this.onTap,
    this.onChanged,
  });

  final void Function()? onTap;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      ///////////////////////////my edite
      margin:const EdgeInsets.only(top: 17),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: Get.height*0.0029282),
      //Get.height*0.0059282
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: AppColor.borderBoxColorTwo,
        ),
      ),
      width: Get.width*0.7777778,
      height: Get.height*0.0663957,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width*0.0486111,
              height: Get.height*0.0237127,
              child: SvgPicture.asset(
                ImageAsset.searchIcon,
              ),
            ),
            SizedBox(
              width: Get.width*0.5833333,
              child: TextFormField(
                onChanged: onChanged,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Row(children: [
              SizedBox(
                height: Get.height*0.0237127,
                child: SvgPicture.asset(
                  ImageAsset.filterLine,
                ),
              ),
              SizedBox(width: Get.width*0.0291667),
              SizedBox(
                width: Get.width*0.0486111,
                child: GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset(ImageAsset.filterIcon),
                ),
              ),

            ]),
          ],
        ),
      ),
    );
  }
}
