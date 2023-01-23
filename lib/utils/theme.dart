import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Color primaryColor = HexColor("#F7692F");
// Color primaryColor = HexColor("#E65100");
Color primaryColorDark = HexColor("#F7692F");
Color primaryColorDarkOne = HexColor("#F7692F");
Color primaryColors = HexColor("#F7692F");
Color primaryColorss = HexColor("#FF6E40");
Color original = HexColor("#FF512F");
Color or = HexColor("#F7692F");
Color accentColor = HexColor("#f85032");
Color textColor = HexColor("#686B78");
Color textColorSmall = HexColor("#93959F");
Color secondryColor =HexColor("#0074AD");
Color grayColor = HexColor("#E2E2E2");
Color grayColorOne = HexColor("#F4F4F5");
Color grayColors = HexColor("#8AE2E2E2");
Color darkGrayColor = HexColor("#717171");
Color blue = HexColor("#2a9d8f");
Color dark_blue = HexColor("#264653");
Color light_orange = HexColor("#f4a261");
Color yellow = HexColor("#e9c46a");
Color blackColor = HexColor("#3E4152");
Color whiteColor = HexColor("#FFFAFA");
Color whiteColors = HexColor("#F2F6FC");
Color rose = HexColor("#fae1db");




extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}