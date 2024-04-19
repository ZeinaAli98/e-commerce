/*

import 'package:fasateen/static/app_color.dart';
import 'package:flutter/material.dart';

class SelectTextField<T> extends StatelessWidget {
  const SelectTextField({
    super.key,
    this.label,
    this.textFieldKey,
    this.value,
    this.onChanged, required this.items,
  });

  final String? label;
  final List<T> items;
  final Key? textFieldKey;
  final T?   value;
  final void Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      width: 379,
      child: DropdownButtonFormField<T>(
        decoration: InputDecoration(
          labelText: label,
          floatingLabelStyle: TextStyle(color: AppColor.primaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColor.primaryColor),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        key: textFieldKey,
        value: value,
        items: items.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(item.toString()),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
*/
