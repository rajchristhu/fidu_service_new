import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/strings.dart';

//edit text style
TextStyle editTextStyle(
    {FontWeight fontWeight = FontWeight.normal,
    double fontSize = 14,
    double? wordSpacing,
    double letterSpacing = 0.2,
    FontStyle? fontStyle,
    Color? color}) {
  return GoogleFonts.poppins(textStyle:TextStyle(
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontSize: fontSize,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing));
}

//hint text style for form field
TextStyle hintTextStyle(
    {FontWeight fontWeight = FontWeight.normal,
    double fontSize = 11,
    double? wordSpacing,
    double letterSpacing = 0,
    FontStyle? fontStyle,
    Color? color}) {
  return GoogleFonts.poppins(textStyle: TextStyle(
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontSize: fontSize,
      color: color,
      // fontFamily: Strings.avenirNext,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing));
}

AutoSizeText textLabel(
    {@required String? text,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 14,
    double? minFontSize,
    double? wordSpacing,
    double letterSpacing = 0.2,
    FontStyle fontStyle=FontStyle.normal,
    // String fontFamily = GoogleFonts.,
    bool underline = false,
    bool centerText = false,
    bool rightText = false,
    int maxLines = 1,
    Color? color}) {
  return AutoSizeText(
    text == null ? "" : text,
    textAlign: centerText
        ? TextAlign.center
        : (rightText ? TextAlign.end : TextAlign.left),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    minFontSize: minFontSize == null ? 10 : minFontSize.roundToDouble(),
    maxFontSize: fontSize == null ? 14 : fontSize.roundToDouble(),
    style: textStyle(
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontSize: fontSize,
        // fontFamily: fontFamily,
        color: color!,
        underline: underline,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing),
  );
}

TextStyle textStyle(
    {FontWeight fontWeight = FontWeight.normal,
    double? fontSize,
    double? wordSpacing,
    double letterSpacing = 0.2,
    FontStyle? fontStyle,
    // String fontFamily = Strings.avenirNext,
    bool underline = false,
    Color? color}) {
  return GoogleFonts.poppins(textStyle:  TextStyle(
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontSize: fontSize,
      color: color,
      // fontFamily: fontFamily,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing));
}
