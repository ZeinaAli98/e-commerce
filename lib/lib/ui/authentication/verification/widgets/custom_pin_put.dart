
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/ui/authentication/verification/verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:get/get.dart';

class CustomPinPut extends GetView<VerificationControllerImp> {
  const CustomPinPut({
    super.key,});



  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(bottom: Get.height*0.0355691),
      height: Get.height*0.0735095 ,
      width: Get.width*0.9065972,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            Expanded(
              child: Pinput(
                controller: controller.textEditingController,
                focusNode: controller.myFocusNode,
                androidSmsAutofillMethod:
                AndroidSmsAutofillMethod.smsRetrieverApi,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: PinTheme(
                    width: 70,
                    height: 62,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          width: 1, color: AppColor.textBodyColor),
                    )),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                focusedPinTheme: PinTheme(
                  width: 70,
                  height: 62,
                  textStyle: TextStyle(color: AppColor.primaryColor),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: AppColor.primaryColor,
                        width: 2,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
