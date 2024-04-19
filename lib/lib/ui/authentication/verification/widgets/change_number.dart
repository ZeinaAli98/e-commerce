import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeNumber extends StatelessWidget {
  const ChangeNumber({
    super.key,
    required this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text("changeTheNumber".tr,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(decoration: TextDecoration.underline)),
    );
  }
}
