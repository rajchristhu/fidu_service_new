import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'BaseColors.dart';

class AppColors implements BaseColors{
  final Map<int, Color> _primary =
  {
    50:const Color.fromRGBO(22, 134, 206, 0.1),
    100:const Color.fromRGBO(22, 134, 206, 0.2),
    200:const Color.fromRGBO(22, 134, 206, 0.3),
    300:const Color.fromRGBO(22, 134, 206, 0.4),
    400:const Color.fromRGBO(22, 134, 206, 0.5),
    500:const Color.fromRGBO(22, 134, 206, 0.6),
    600:const Color.fromRGBO(22, 134, 206, 0.7),
    700:const Color.fromRGBO(22, 134, 206, 0.8),
    800:const Color.fromRGBO(22, 134, 206, 0.9),
    900:const Color.fromRGBO(22, 134, 206, 1.0),
  };

  @override
  MaterialColor get colorAccent => Colors.amber;

  @override
  Color get colorPrimary => HexColor("#F7692F");

  @override
  Color get colorPrimaryText => Color(0xff49ABFF);

  @override
  Color get colorSecondaryText => Color(0xff3593FF);

  @override
  Color get colorWhite => Color(0xffffffff);

  @override
  Color get colorBlack => HexColor("#686B78");

  @override
  Color get castChipColor => Colors.deepOrangeAccent;

  @override
  Color get catChipColor => Colors.indigoAccent;
}