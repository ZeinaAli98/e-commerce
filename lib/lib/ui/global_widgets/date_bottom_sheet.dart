
import 'package:fasateen/lib/static/app_color.dart';
import 'package:fasateen/lib/ui/global_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DateBottomSheet extends StatelessWidget {
  const DateBottomSheet({
    Key? key,
    required this.selectedDate,
    required this.onDateChanged,
    required this.onPressed,
  });

  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.textBodyColorTwo,
      ),

      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.47,
            child: CalendarDatePicker(
              onDateChanged: onDateChanged,
              initialDate: selectedDate,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),

            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          PrimaryButton(
            onPressed: onPressed,
            text: "confirm".tr,
            backgroundColor: AppColor.primaryColor,
            textStyle: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColor.textBodyColorTwo),
          ),
          SizedBox(
            height: Get.height * 0.0177846,
          ),
        ],
      ),
    );
  }
}

