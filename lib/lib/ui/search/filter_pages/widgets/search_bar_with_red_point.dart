
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:fasateen/lib/ui/global_widgets/go_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchBarWithRedPoint extends StatelessWidget {
  const SearchBarWithRedPoint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Get.height*0.0059282),
      color: AppColor.whiteBackground,
      height: Get.height*0.0972222,
      width: Get.width,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            const GoBack(),
            SizedBox(
              width: Get.width*0.0364583,
            ),
            Column(
              children: [Stack(children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: Get.width *0.02),
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
                          child: const Text(""),
                        ),
                        Row(children: [
                          SvgPicture.asset(
                            ImageAsset.filterLine,
                          ),
                          SizedBox(
                            width: Get.width*0.0291667,
                          ),
                          SizedBox(
                            width: Get.width*0.0486111,
                            height: Get.height*0.0237127,
                            child:
                            SvgPicture.asset(ImageAsset.filterIcon),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
                // Positioned(
                //     top: 3,
                //     left: 3,
                //     child: SizedBox(width:9,height:9,child: SvgPicture.asset(ImageAsset.redPoint)))
              ])],
            ),
          ],
        ),
      ),
    );
  }
}
