import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryTextHead extends StatelessWidget {
  const PrimaryTextHead({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width*0.6684028,
      height: Get.height*0.0403117,
      margin: const EdgeInsets.only(bottom: 15),
      child: Text(
        text,textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}
