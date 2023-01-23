import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/main_page/page/cart_page.dart';
import '../../view/main_page/page/order_page.dart';
import '../../view/main_page/page/profile_page.dart';
import '../../view/main_page/page/shop.dart';


class ControlViewModel extends GetxController {
  int _navigatorValue = 2;

  get navigatorValue => _navigatorValue;
  Widget currentScreen = ShopMainPage();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen =  Container();
          break;
        }
      case 1:
        {
          currentScreen = CartPage();
          break;
        }
      case 2:
        {
          currentScreen = ShopMainPage();
          break;
        }
      case 3:
        {
          currentScreen = OrderPage();
          break;
        }
      case 4:
        {
          currentScreen = Profile();
          break;
        }
    }
    update();
  }
}
