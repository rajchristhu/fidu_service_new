import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future? dialogData;

class FiduProgressDialog {
  static bool isProgressVisible = false;

  static final FiduProgressDialog _instance = FiduProgressDialog._();

  FiduProgressDialog._();

  static FiduProgressDialog get instance => _instance ?? FiduProgressDialog._();

  showProgressDialog(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!isProgressVisible) {
        print("Progress Dialog: Showing Progress $isProgressVisible");
        createDialog(context);
      } else {
        print("Progress Dialog: Dialog is already present");
        // dismissDialog(context);
        isProgressVisible = false;
        Navigator.pop(context);
        createDialog(context);
      }
    });
  }

  createDialog(BuildContext context) {
    isProgressVisible = true;
    dialogData = showDialog(
      barrierDismissible: false,
      barrierColor: Colors.transparent.withOpacity(0.5),
      context: context,
      builder: (ctx) => WillPopScope(
        onWillPop: () => Future.value(false),
        child: Platform.isAndroid ? _buildAndroid(context) : _buildIos(context),
      ),
    );
  }

  void dismissDialog(context) {
    // print("Progress Dialog : Dismiss called $isProgressVisible");
    if (!isProgressVisible) {
      return;
    }
    if (isProgressVisible) {
      isProgressVisible = false;
      Navigator.pop(context);
    }
    // print("Progress Dialog : Dismiss called after pop $isProgressVisible");
  }

  void setDialogStatus(bool isShowing) {
    isProgressVisible = isShowing;
  }

  Widget _buildAndroid(context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _loadImage(),
    );
  }

  Widget _loadImage() {
    return   Lottie.asset(
      'assets/lottie/loading.json',
      // controller: _controller,
      width: 250,
      height: 250,
      onLoaded: (composition) {
        // Configure the AnimationController with the duration of the
        // Lottie file and start the animation.
        // _controller
        //   ..duration = composition.duration
        //   ..forward();
      },
    );
  }

  Widget _buildIos(context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent.withOpacity(0.0),
      child: _loadImage(),
    );
  }
}
