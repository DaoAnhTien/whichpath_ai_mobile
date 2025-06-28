import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String fontBold = "SF-Pro-Display-Bold";
  static const String fontSemibold = "SF-Pro-Display-Semibold";
  static const String fontMedium = "SF-Pro-Display-Medium";
  static const String fontRegular = "SF-Pro-Display-Regular";

  static const _baseTextStyle = TextStyle(
    fontFamily: fontRegular,
    color: AppColors.neutral800,
    letterSpacing: -0.4,
  );

  // Regular
  static TextStyle regular11() =>
      _baseTextStyle.merge(TextStyle(fontSize: 11, fontFamily: fontRegular));

  static TextStyle regular12() =>
      _baseTextStyle.merge(TextStyle(fontSize: 12, fontFamily: fontRegular));

  static TextStyle regular13() =>
      _baseTextStyle.merge(TextStyle(fontSize: 13, fontFamily: fontRegular));

  static TextStyle regular14() =>
      _baseTextStyle.merge(TextStyle(fontSize: 14, fontFamily: fontRegular));

  static TextStyle regular15() =>
      _baseTextStyle.merge(TextStyle(fontSize: 15, fontFamily: fontRegular));

  static TextStyle regular16() =>
      _baseTextStyle.merge(TextStyle(fontSize: 16, fontFamily: fontRegular));

  static TextStyle regular17() =>
      _baseTextStyle.merge(TextStyle(fontSize: 17, fontFamily: fontRegular));

  static TextStyle regular18() =>
      _baseTextStyle.merge(TextStyle(fontSize: 18, fontFamily: fontRegular));

  static TextStyle regular19() =>
      _baseTextStyle.merge(TextStyle(fontSize: 19, fontFamily: fontRegular));

  static TextStyle regular20() =>
      _baseTextStyle.merge(TextStyle(fontSize: 20, fontFamily: fontRegular));

  // Medium
  static TextStyle medium11() =>
      _baseTextStyle.merge(TextStyle(fontSize: 11, fontFamily: fontMedium));

  static TextStyle medium12() =>
      _baseTextStyle.merge(TextStyle(fontSize: 12, fontFamily: fontMedium));

  static TextStyle medium13() =>
      _baseTextStyle.merge(TextStyle(fontSize: 13, fontFamily: fontMedium));

  static TextStyle medium14() =>
      _baseTextStyle.merge(TextStyle(fontSize: 14, fontFamily: fontMedium));

  static TextStyle medium15() =>
      _baseTextStyle.merge(TextStyle(fontSize: 15, fontFamily: fontMedium));

  static TextStyle medium16() =>
      _baseTextStyle.merge(TextStyle(fontSize: 16, fontFamily: fontMedium));

  static TextStyle medium17() =>
      _baseTextStyle.merge(TextStyle(fontSize: 17, fontFamily: fontMedium));

  static TextStyle medium18() =>
      _baseTextStyle.merge(TextStyle(fontSize: 18, fontFamily: fontMedium));

  static TextStyle medium19() =>
      _baseTextStyle.merge(TextStyle(fontSize: 19, fontFamily: fontMedium));

  static TextStyle medium20() =>
      _baseTextStyle.merge(TextStyle(fontSize: 20, fontFamily: fontMedium));

  // Semibold
  static TextStyle semibold11() =>
      _baseTextStyle.merge(TextStyle(fontSize: 11, fontFamily: fontSemibold));

  static TextStyle semibold12() =>
      _baseTextStyle.merge(TextStyle(fontSize: 12, fontFamily: fontSemibold));

  static TextStyle semibold13() =>
      _baseTextStyle.merge(TextStyle(fontSize: 13, fontFamily: fontSemibold));

  static TextStyle semibold14() =>
      _baseTextStyle.merge(TextStyle(fontSize: 14, fontFamily: fontSemibold));

  static TextStyle semibold15() =>
      _baseTextStyle.merge(TextStyle(fontSize: 15, fontFamily: fontSemibold));

  static TextStyle semibold16() =>
      _baseTextStyle.merge(TextStyle(fontSize: 16, fontFamily: fontSemibold));

  static TextStyle semibold17() =>
      _baseTextStyle.merge(TextStyle(fontSize: 17, fontFamily: fontSemibold));

  static TextStyle semibold18() =>
      _baseTextStyle.merge(TextStyle(fontSize: 18, fontFamily: fontSemibold));

  static TextStyle semibold19() =>
      _baseTextStyle.merge(TextStyle(fontSize: 19, fontFamily: fontSemibold));

  static TextStyle semibold20() =>
      _baseTextStyle.merge(TextStyle(fontSize: 20, fontFamily: fontSemibold));

  // Bold
  static TextStyle bold11() =>
      _baseTextStyle.merge(TextStyle(fontSize: 11, fontFamily: fontBold));

  static TextStyle bold12() =>
      _baseTextStyle.merge(TextStyle(fontSize: 12, fontFamily: fontBold));

  static TextStyle bold13() =>
      _baseTextStyle.merge(TextStyle(fontSize: 13, fontFamily: fontBold));

  static TextStyle bold14() =>
      _baseTextStyle.merge(TextStyle(fontSize: 14, fontFamily: fontBold));

  static TextStyle bold15() =>
      _baseTextStyle.merge(TextStyle(fontSize: 15, fontFamily: fontBold));

  static TextStyle bold16() =>
      _baseTextStyle.merge(TextStyle(fontSize: 16, fontFamily: fontBold));

  static TextStyle bold17() =>
      _baseTextStyle.merge(TextStyle(fontSize: 17, fontFamily: fontBold));

  static TextStyle bold18() =>
      _baseTextStyle.merge(TextStyle(fontSize: 18, fontFamily: fontBold));

  static TextStyle bold19() =>
      _baseTextStyle.merge(TextStyle(fontSize: 19, fontFamily: fontBold));

  static TextStyle bold20() =>
      _baseTextStyle.merge(TextStyle(fontSize: 20, fontFamily: fontBold));

  static TextStyle bold28() =>
      _baseTextStyle.merge(TextStyle(fontSize: 28, fontFamily: fontBold));
}
