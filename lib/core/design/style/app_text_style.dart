import 'package:flutter/material.dart';

import 'package:gutenberg/core/design/measurement/app_dimen.dart';
import 'package:gutenberg/core/design/style/app_typeface.dart';

class AppText {
  static const AppTextStyle caption08 = AppTextStyle(
    fontFamily: AppTypeface.poppins,
    fontSize: AppDimen.fontSmall,
    fontWeight: FontWeight.w600,
  );

  static const AppTextStyle caption10 = AppTextStyle(
    fontFamily: AppTypeface.poppins,
    fontSize: AppDimen.fontSmall,
    fontWeight: FontWeight.normal,
  );

  static const AppTextStyle caption10Medium = AppTextStyle(
    fontFamily: AppTypeface.poppins,
    fontSize: 10,
    fontWeight: FontWeight.w600,
  );

  static const AppTextStyle caption10Bold = AppTextStyle(
    fontFamily: AppTypeface.poppins,
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );

  static const AppTextStyle caption12 = AppTextStyle(
    fontFamily: AppTypeface.poppins,
    fontSize: AppDimen.fontMedium,
    fontWeight: FontWeight.normal,
  );

  static const AppTextStyle caption12Medium = AppTextStyle(
    fontFamily: AppTypeface.poppins,
    fontSize: AppDimen.fontMedium,
    fontWeight: FontWeight.w600,
  );

  static const AppTextStyle caption12Bold = AppTextStyle(
    fontFamily: AppTypeface.poppins,
    fontSize: AppDimen.fontMedium,
    fontWeight: FontWeight.w700,
  );

  static const AppTextStyle body14 = AppTextStyle(
    fontFamily: AppTypeface.poppins,
    fontSize: AppDimen.fontNormal,
    fontWeight: FontWeight.normal,
  );

  static const AppTextStyle body14Bold = AppTextStyle(
    fontFamily: AppTypeface.poppins,
    fontSize: AppDimen.fontNormal,
    fontWeight: FontWeight.w700,
  );

  static const AppTextStyle body16 = AppTextStyle(
    fontFamily: AppTypeface.poppins,
    fontSize: AppDimen.fontLarge,
    fontWeight: FontWeight.normal,
  );

  static const AppTextStyle body16Bold = AppTextStyle(
    fontFamily: AppTypeface.poppins,
    fontSize: AppDimen.fontLarge,
    fontWeight: FontWeight.w700,
  );

  static const AppTextStyle subheading18 = AppTextStyle(
    fontFamily: AppTypeface.poppins,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const AppTextStyle subheading20 = AppTextStyle(
    fontFamily: AppTypeface.poppins,
    fontSize: AppDimen.fontExtraLarge,
    fontWeight: FontWeight.w600,
  );

  static const AppTextStyle heading24 = AppTextStyle(
    fontFamily: AppTypeface.poppins,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static const AppTextStyle heading28 = AppTextStyle(
    fontFamily: AppTypeface.poppins,
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  static const AppTextStyle heading32 = AppTextStyle(
    fontFamily: AppTypeface.poppins,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );

  static const AppTextStyle heading42 = AppTextStyle(
    fontFamily: AppTypeface.poppins,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );
}

class AppTextStyle {
  final String fontFamily;

  final double fontSize;

  final FontWeight fontWeight;

  final TextDecoration? decoration;

  const AppTextStyle({
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    this.decoration,
  });

  AppTextStyle copyWith({
    String? fontFamily,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) =>
      AppTextStyle(
        fontFamily: fontFamily ?? this.fontFamily,
        fontSize: fontSize ?? this.fontSize,
        fontWeight: fontWeight ?? this.fontWeight,
        decoration: decoration ?? this.decoration,
      );
}
