import 'package:flutter/material.dart';

import '../resources/size_helper.dart';


class FiduLogo extends StatelessWidget {
  final SizeHelper _sizeHelper = SizeHelper.getInstance();

  @override
  Widget build(BuildContext context) {
    return Image.asset( 'assets/icon/icon_logo.png',
      width: _sizeHelper.logoSize(context).width,
      height: _sizeHelper.logoSize(context).height,
    );
  }
}
