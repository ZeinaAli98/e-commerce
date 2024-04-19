
import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModernButton extends StatelessWidget {
  const ModernButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 15,
        width: 47,

        decoration: BoxDecoration(
          color: AppColor.primaryColorWithObesity,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: FittedBox(
          child: Text(
            "modern".tr,
              style:TextStyle(fontSize: 14,color: AppColor.primaryColor,fontWeight: FontWeight.w600)
            //   Theme.of(context).textTheme.bodySmall!.copyWith(
            //   color: AppColor.primaryColor,
            //   fontWeight: FontWeight.w600,
            // ),
          ),
        ),
      ),
    );
  }
}
