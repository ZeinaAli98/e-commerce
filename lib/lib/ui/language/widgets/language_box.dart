
import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageBox extends StatelessWidget {
  const LanguageBox({
    super.key, required this.text, this.onTap, this.onChanged, this.groupValue, this.value, required this.isClicked,
  });
  final String text ;
  final void Function()? onTap ;
  final void Function(dynamic)? onChanged ;
  final dynamic groupValue ;
  final dynamic value ;
  final bool isClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        margin:  EdgeInsets.symmetric(vertical: Get.height*0.0094851),
        width: Get.width*0.9236111,
        height: Get.height*0.0806233,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Get.width*0.0364583),
          border: Border.all(color: isClicked ?AppColor.primaryColor:AppColor.borderBoxColor),
        ),
        child: Row(
          children: [
             SizedBox(width: Get.width*0.0243056,),
             Radio(value: value, groupValue: groupValue, onChanged: onChanged,activeColor:AppColor.primaryColor, ),
             SizedBox(width: Get.width*0.0243056,),
             SizedBox(height: Get.height*0.0248984,child: FittedBox(child: Text(text)))
          ],
        ),
      ),
    );
  }
}
