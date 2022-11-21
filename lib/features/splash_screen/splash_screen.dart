import 'dart:convert';
import 'package:fidu_service/widget/base_app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../resources/colors.dart';
import '../../resources/size_helper.dart';
import '../../widget/fidu_logo.dart';
import '../../widget/text_widget.dart';
import 'package:get/get.dart';

import '../onboard_screen/onboard_screen.dart';

class SplashPage extends FiduServiceFullWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends FiduService<SplashPage> {
  SizeHelper _sizeHelper = SizeHelper.getInstance();

  @override
  void initState() {
    super.initState();
    _navigate();
    // FiduProgressDialog.instance.showProgressDialog(context);

  }

  ///Navigate to Login screen
  void _navigate() {
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        Get.to(OnboardingScreen());
        // Navigator.pushReplacementNamed(context, RoutePaths.Login);
      }
    });
  }

  @override
  Widget buildBody() {
    return Container(
      // color: accentColor,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              accentColor,
              secondaryColor,
            ],
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLogo(),
                _buildDivider(),
                _buildTagLine(),
              ],
            ),
          ),
          // _clientLogo(),
        ],
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: EdgeInsets.only(top: _sizeHelper.dividerLineTopMargin(context)),
      width: _sizeHelper.dividerWidth(context),
      child: Divider(
        height: 1,
        color: brownBackGroundColor,
      ),
    );
  }

  Widget _buildTagLine() {
    return
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 0,
      ),
      child: FadeIn(
    child:SizedBox(
        child: DefaultTextStyle(
          style:  textStyle(
            fontSize: 42.0,
            fontWeight: FontWeight.w600
          ),  child:AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText('Fidu Service',speed: const Duration(milliseconds: 250) ),
        // TypewriterAnimatedText('Design first, then code'),
      ],
      onTap: () {
        print("Tap Event");
      },
    )
    )    // textLabel(
    //       text: "FIDU SERVICE",
    //       fontSize: 32,
    //       centerText: true,
    //       maxLines: 1,
    //       color: Colors.white,
    //       fontWeight: FontWeight.w700,
    //       letterSpacing: 0.2)

        ,)
    ));
  }




  ///build app logo at the center
  Widget _buildLogo() {
    return FadeInDownBig(
      from: 1,
      duration: Duration(milliseconds: 1000),
      delay: Duration(milliseconds: 500),
      child: FiduLogo(),
    );
  }
}
