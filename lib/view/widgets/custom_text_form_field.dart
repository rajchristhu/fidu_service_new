import 'package:flutter/material.dart';
import '../../res/Resources.dart';

import '../widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final String? Function(String?) validatorFn;
  final Function(String?) onSavedFn;
  final String initialValue;
  final TextInputType? keyboardType;
  final bool obscureText;

  CustomTextFormField({
    required this.title,
    required this.hintText,
    required this.validatorFn,
    required this.onSavedFn,
    this.initialValue = '',
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: title,
          fontSize: 14,
          color: Colors.grey.shade900,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 14,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Resources(context).color.colorPrimary,
              ),
            ),
          ),
          keyboardType: keyboardType,
          textInputAction: TextInputAction.next,
          obscureText: obscureText,
          initialValue: initialValue,
          validator: validatorFn,
          onSaved: onSavedFn,
        ),
      ],
    );
  }
}
