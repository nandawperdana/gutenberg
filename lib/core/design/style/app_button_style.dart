import 'package:flutter/material.dart';

import 'package:gutenberg/core/design/decoration/app_border.dart';
import 'package:gutenberg/core/design/style/app_color.dart';

class AppButton {
  static AppButtonStyle primary = AppButtonStyle(
    textColor: AppColor.systemWhite,
    disabledTextColor: AppColor.systemWhite.withOpacity(0.4),
    buttonColor: AppColor.navy50,
    disabledButtonColor: AppColor.navy20,
    loadingColor: AppColor.systemWhite,
  );

  static AppButtonStyle secondary = AppButtonStyle(
    textColor: AppColor.gray80,
    disabledTextColor: AppColor.gray80.withOpacity(0.4),
    buttonColor: AppColor.gray20,
    disabledButtonColor: AppColor.gray05,
    loadingColor: AppColor.gray80,
  );
}

class AppButtonStyle {
  final Color textColor;

  final Color disabledTextColor;

  final Color buttonColor;

  final Color disabledButtonColor;

  final Color loadingColor;

  final AppBorder? buttonBorder;

  const AppButtonStyle({
    required this.textColor,
    required this.disabledTextColor,
    required this.buttonColor,
    required this.disabledButtonColor,
    required this.loadingColor,
    this.buttonBorder,
  });

  AppButtonStyle copyWith({
    Color? textColor,
    Color? disabledTextColor,
    Color? buttonColor,
    Color? disabledButtonColor,
    Color? loadingColor,
    AppBorder? buttonBorder,
  }) =>
      AppButtonStyle(
        textColor: textColor ?? this.textColor,
        disabledTextColor: disabledTextColor ?? this.disabledTextColor,
        buttonColor: buttonColor ?? this.buttonColor,
        disabledButtonColor: disabledButtonColor ?? this.disabledButtonColor,
        loadingColor: loadingColor ?? this.loadingColor,
        buttonBorder: buttonBorder ?? this.buttonBorder,
      );
}
