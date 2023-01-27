import 'package:fidu_service/resources/colors.dart';
import 'package:flutter/material.dart';

import '../res/Resources.dart';
import '../view/widgets/custom_buttom.dart';

showDataAlert(
    context, String title, String buttonText, VoidCallback? onPressedFn) {
  showDialog(
      context: context,
      barrierColor: Colors.black38,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            top: 10.0,
          ),
          title: Center(
            child: Text(
              title,
              style: const TextStyle(fontSize: 24.0),
            ),
          ),
          content: SizedBox(
            height: 90,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          color: Resources(context).color.colorPrimary),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: CustomButton(
                        buttonText,
                        onPressedFn,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
