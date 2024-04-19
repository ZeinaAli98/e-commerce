
import 'package:fasateen/lib/ui/global_widgets/primary_arrow_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoBack extends StatelessWidget {
  const GoBack({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.ltr,
      child: Column(children: [
         SizedBox(
          height: Get.height*0.0214,
        ),
        Row(
          children: [
            SizedBox(
              width: Get.width*0.041319,
            ),
             const ArrowBackButton(),
          ],
        ),
      ]),
    );
  }
}
