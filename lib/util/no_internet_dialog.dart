import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fidu_service/util/connectivity_service.dart';


import '../resources/colors.dart';
import '../resources/strings.dart';

bool isDialogVisible = false;

showNoInternetDialog(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    if (!isDialogVisible) {
      isDialogVisible = true;
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) => WillPopScope(
          onWillPop: () => Future.value(false),
          child:
          Platform.isAndroid ? _buildAndroid(context) : _buildIos(context),
        ),
      ).then((value) {
        isDialogVisible = false;
      });
    } else {
      // print("Dialog is already present");
    }
  });
}

Widget _buildAndroid(context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    contentTextStyle: const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
    title: Text(Strings.error,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
    //textLabel(text: Strings.error, fontSize: 14),
    content: Text(
      Strings.noInternetConnection,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
    ),
    //textLabel(text: Strings.sessionTimeOut, fontSize: 14),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          _checkConnection(context);
        },
        child: Text(
          Strings.retry,
          style:  TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: accentColor,
          ),
        ),
      ),
    ],
  );
}

Widget _buildIos(context) {
  return CupertinoAlertDialog(
    title: Text(Strings.error,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
    //textLabel(text: Strings.error, fontSize: 14),
    content: Text(
      Strings.noInternetConnection,
      textAlign: TextAlign.start,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
    ),
    actions: <Widget>[
      CupertinoDialogAction(
        onPressed: () {
          _checkConnection(context);
        },
        child: Text(Strings.retry,
            style:  TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: accentColor,
            )),
      ),
    ],
  );
}

void _checkConnection(context) {
  ConnectionStatusSingleton.getInstance().checkConnection().then((value) {
    isDialogVisible = false;
    Navigator.pop(context);
    if (!value) {
      showNoInternetDialog(context);
    }
  });
}
