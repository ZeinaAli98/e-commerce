
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/static/image_asset.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/events/event.dart';

class EventBox extends StatelessWidget {
   EventBox({
    super.key, this.function,
  });
  final void Function()? function;

  @override
  Widget build(BuildContext context) {
    List<Event> eventsListView = [
      Event("Gift", ImageAsset.redPoint),
      Event("Gift",ImageAsset.redPoint),
      Event("Gift", ImageAsset.redPoint),
      Event("Gift",ImageAsset.redPoint),
    ];
    return Container(
      margin:  EdgeInsets.only(right: Get.width*0.0413194),
      height: Get.height*0.1114499,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: eventsListView.map((ev) {
          return GestureDetector(
            onTap: function,
            child: Stack(children: [
              Container(
                margin:  EdgeInsets.symmetric(horizontal: Get.width*0.0170139),
                padding: EdgeInsets.zero,
                width: Get.width*0.2211806,
                height: Get.height*0.1114499,
                decoration: BoxDecoration(
                  color: AppColor.eventsBackground,
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              Positioned(
                top: 0,
                // ignore: unrelated_type_equality_checks
                left: Get.deviceLocale == "ar" ? Get.width*0.0121528 : Get.width*0.2795139,
                child: SvgPicture.asset(
                  ev.alert??"",
                ),
              ),
              Row(children: [
                 SizedBox(
                  width: Get.width*0.0243056,
                ),
                Text(ev.text??"",style: TextStyle(color: AppColor.storyColor),),
              ]),
            ]),
          );
        }).toList(),
      ),
    );
  }
}
