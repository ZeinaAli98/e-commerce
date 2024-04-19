import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryTextBody extends StatelessWidget {
  const PrimaryTextBody({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: Get.height * 0.0177846,
          right: Get.width * 0.1190972,
          left: Get.width * 0.1190972),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
