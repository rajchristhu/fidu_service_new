import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final Function onPress;

  CustomButtonSocial({
    required this.text,
    required this.imageName,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.grey.shade50,
      ),
      child:    ElevatedButton(
          child: Row(
            children: [
              Image.asset(imageName),
              SizedBox(
                width: 100,
              ),
              CustomText(
                text: text,
              ),
            ],
          ),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(accentColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  )
              )
          ),
          onPressed: () => null
      )




    );
  }
}
