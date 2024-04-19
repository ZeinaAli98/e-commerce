
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

  class SearchBarWithIcon extends StatelessWidget {
  const SearchBarWithIcon({
    super.key,
    this.onTap,
    this.controller,
    this.onChanged,
  });

  final void Function()? onTap;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: Get.width*0.923611,
        height: Get.height*0.066396,
        decoration: BoxDecoration(
          color: AppColor.whiteBackground,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height*0.023713,
              width: Get.width*0.048611,
              child: SvgPicture.asset(
                ImageAsset.searchIcon,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: Get.height*0.0047425),
              width: Get.width*0.680556,
              child: TextFormField(
                onChanged: onChanged,
                controller: controller,
                decoration:  InputDecoration(
                  hintText: "searchForProducts".tr,
                  isDense: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Row(children: [
              SvgPicture.asset(
                ImageAsset.filterLine,
              ),
               SizedBox(
                width: Get.width*0.029167,
              ),
              GestureDetector(
                onTap: onTap,
                child: SizedBox(

                  height: Get.height*0.024898,
                  child: Row(
                    children: [
                      SvgPicture.asset(ImageAsset.filterIcon),
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
