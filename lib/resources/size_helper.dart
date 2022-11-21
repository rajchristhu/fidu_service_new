import 'package:flutter/material.dart';

import 'dimens.dart';

class SizeHelper extends ScreenSizeUtil {
  static final SizeHelper _instance =
      SizeHelper._privateConstructor();

  SizeHelper._privateConstructor();

  static SizeHelper getInstance() {
    return _instance;
  }

  Size _splashLogoSize = Size(300, 300);
  Size _clientLogoSize = Size(161, 44);
  double _clientLogoBottomPadding = 61;
  double _tagLineHorizontalMargin = 98;
  double _tagLineVerticalMargin = 34;
  double _dividerLineTopMargin = 40;
  double _dividerWidth = 87;

  double tagLineHorizontalMargin(context) =>
      getWidth(context, _tagLineHorizontalMargin);
  double _fontSize = 16;

  double fontSize(context) => getWidth(context, _fontSize);

  double clientLogoBottomPadding(context) =>
      getHeight(context, _clientLogoBottomPadding);

  Size logoSize(context) {
    return Size(getWidth(context, _splashLogoSize.width),
        getHeight(context, _splashLogoSize.height));
  }

  Size clientLogoSize(context) {
    return Size(getWidth(context, _clientLogoSize.width),
        getHeight(context, _clientLogoSize.height));
  }

  double tagLineVerticalMargin(context) =>
      getHeight(context, _tagLineVerticalMargin);

  double dividerLineTopMargin(context) =>
      getHeight(context, _dividerLineTopMargin);

  double dividerWidth(context) => getWidth(context, _dividerWidth);



}
