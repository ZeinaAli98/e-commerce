// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdownFormField extends StatelessWidget {
  const CustomDropdownFormField({
    super.key,
    this.dropdownButtonFormFieldKey,
    this.dropdownButtonFormFieldValue,
    this.onChanged,
    required this.items,
  });

  final Key? dropdownButtonFormFieldKey;
  final Object? dropdownButtonFormFieldValue;
  final void Function(Object?)? onChanged;
  final List<DropdownMenuItem<Object>>? items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,

        child: DropdownButtonFormField(
          padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
         isExpanded: true,
          decoration: InputDecoration(
            prefixIcon: const Text(""),
            contentPadding:  EdgeInsets.symmetric(vertical:Get.height*0.0177846,horizontal: Get.width*0.0243056),
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
          ),

          key: dropdownButtonFormFieldKey,
          value: dropdownButtonFormFieldValue,
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
