
import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BooleanCheckBox extends StatelessWidget {
    BooleanCheckBox({
    super.key, this.onChanged, required this.text,required this.value
  });
  final String text;
  final void Function(bool?)? onChanged;
  final bool value;


  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: Get.width*0.0583333,
        height: Get.height*0.0284553,
        child: Checkbox(
          value: value,
          onChanged: onChanged,
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                5,
              ),
            ),
          ),
        ),
      ),
        SizedBox(
         width: Get.width*0.0243056,
      ),
      SizedBox(height: Get.height*0.0284553,child: FittedBox(child: Text(text,style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColor.textBodyColor),)))
    ]);
  }
}
