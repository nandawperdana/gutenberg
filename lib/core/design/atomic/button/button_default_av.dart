import 'package:flutter/material.dart';

import 'package:gutenberg/core/design/atomic/button/button_base_av.dart';
import 'package:gutenberg/core/design/measurement/dimension.dart';
import 'package:gutenberg/core/design/style/app_button_style.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';

class ButtonDefaultAV extends ButtonBaseAV {
  const ButtonDefaultAV({
    Key? key,
    required String text,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Dimension? iconDimension,
    required OnTap onTap,
    required AppButtonStyle style,
    bool isLoading = false,
    bool isDisabled = false,
  }) : super(
          key: key,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          iconDimension: iconDimension,
          text: text,
          isLoading: isLoading,
          isDisabled: isDisabled,
          onTap: onTap,
          buttonStyle: style,
        );

  @override
  double get padding => 20;

  @override
  AppTextStyle get textStyle => AppText.body16Bold;

  @override
  Dimension get dimension => const Dimension(height: 44);
}
