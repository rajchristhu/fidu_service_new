import 'package:flutter/cupertino.dart';
import '../../res/strings/Strings.dart';
import '../../res/strings/StringsValue.dart';

import 'colors/AppColors.dart';
import 'dimentions/AppDimension.dart';

class Resources {
  BuildContext _context;

  Resources(this._context);

  Strings get strings {
    return StringsValue();
  }

  AppColors get color {
    return AppColors();
  }

  AppDimension get dimension {
    return AppDimension();
  }

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
