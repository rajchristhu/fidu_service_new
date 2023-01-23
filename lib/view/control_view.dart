import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../view/widgets/appBar.dart';
import '../../view/widgets/bottom_nav.dart';
import '../../view/widgets/end_drawer.dart';

import '../core/view_model/auth_view_model.dart';
import '../core/view_model/control_view_model.dart';
import '../core/view_model/home_view_model.dart';
import '../utils/theme.dart';
import '../view/main_page/widget/background.dart';
import '../view/main_page/widget/separate.dart';


class ControlView extends GetWidget<AuthViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        endDrawer: endDrawer(context),
        appBar: appBar(_scaffoldKey),
        body: controller.currentScreen,
        bottomNavigationBar: bottomNavigationBar(_bottomNavigationKey),
      ),
    );
  }
}
