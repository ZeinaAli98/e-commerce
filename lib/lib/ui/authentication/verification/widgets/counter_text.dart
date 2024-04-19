import 'package:fasateen/lib/ui/authentication/verification/verification_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterText extends StatelessWidget {
  const CounterText({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;

  String formatTime(int value) {
    return value.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: VerificationControllerImp(),
      builder: (controller) {
        final formattedTime = '${formatTime(controller.min)}:${formatTime(controller.sec)}';

        return GestureDetector(
          onTap: onTap,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "resendTheCodeAfter".tr,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: " $formattedTime ",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

