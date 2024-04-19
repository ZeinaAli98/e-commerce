

import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationTextField extends StatefulWidget {
  const VerificationTextField({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  final void Function(String)? onChanged;

  @override
  _VerificationTextFieldState createState() => _VerificationTextFieldState();
}

class _VerificationTextFieldState extends State<VerificationTextField> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  bool _readOnly = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.text.isNotEmpty && !_readOnly) {
        setState(() {
          _readOnly = true;
          _focusNode.unfocus();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      width: 70,
      child: TextFormField(
        controller: _controller,
        focusNode: _focusNode,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          if (!_readOnly) {
            widget.onChanged?.call(value);
          }
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        readOnly: _readOnly,
        style: TextStyle(
          color: AppColor.primaryColor,
          fontSize: 28,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 35),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}

