import 'package:flutter/material.dart';
import '../../res/Resources.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressedFn;

  CustomButton(this.text, this.onPressedFn);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Resources(context).color.colorPrimary,
        elevation: 0,
      ),
      onPressed: onPressedFn,
      child: CustomText(
        text: text,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        alignment: Alignment.center,
      ),
    );
  }
}
