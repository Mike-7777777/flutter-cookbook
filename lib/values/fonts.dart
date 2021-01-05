import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:my_app/values/values.dart';

class AppFontsStyle {
  //标题
  static const TextStyle subtitleStyle = TextStyle(
    color: AppColors.primaryText,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w500,
    fontSize: 20,
    height: 1.2,
  );
  static const TextStyle titleStyle = TextStyle(
    color: AppColors.primaryText,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w600,
    fontSize: 25,
    height: 2,
  );
  static const TextStyle normalStyle = TextStyle(
    color: AppColors.primaryText,
    fontFamily: "Avenir",
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.5,
  );
}
