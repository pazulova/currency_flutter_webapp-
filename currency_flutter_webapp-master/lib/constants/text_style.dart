
import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {
  static const titleStyle = TextStyle(
      color: AppColors.white, fontSize: 25, fontWeight: FontWeight.bold);
  static const textFieldLabelStyle = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 18,
      color: AppColors.secondColor);
  static const textFieldStyle = TextStyle(
      color: AppColors.black, fontSize: 24, fontWeight: FontWeight.bold);
  static const resultTextStyle = TextStyle(
    color: AppColors.black,
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
  );
  static const resultStyle = TextStyle(
    color: AppColors.secondColor,
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
  );
  static const historyText = TextStyle(
    color: AppColors.mainColor,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );
  static const historySubtext = TextStyle(
    color: AppColors.secondColor,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );
}
