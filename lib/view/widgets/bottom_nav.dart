
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../core/view_model/control_view_model.dart';
import '../../utils/theme.dart';

Widget bottomNavigationBar(GlobalKey<CurvedNavigationBarState> bottomNavigationKey) {
  return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => CurvedNavigationBar(
        key: bottomNavigationKey,
        index: controller.navigatorValue,
        height: 55.0,
        items: <Widget>[
          Icon(
            Icons.more_vert_outlined,
            size: 22,
            color: whiteColor,
          ),
          Icon(Icons.shopping_cart_rounded, size: 22, color: whiteColor),
          Icon(Icons.shopping_bag_rounded, size: 22, color: whiteColor),
          Icon(Icons.local_shipping_rounded, size: 22, color: whiteColor),
          Icon(Icons.person_pin, size: 22, color: whiteColor),
        ],
        color: primaryColors,
        buttonBackgroundColor: primaryColors,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        letIndexChange: (index) => true,
      ));
}
