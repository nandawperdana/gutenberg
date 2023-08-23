import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gutenberg/core/design/atomic/form/input_text_base_av.dart';
import 'package:gutenberg/core/design/molecule/form/text_field_base_mv.dart';
import 'package:gutenberg/core/design/style/app_color.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';

class InputTextAV extends InputTextBaseAV {
  final InputType inputType;

  const InputTextAV({
    Key? key,
    required this.inputType,
    required AppTextStyle textStyle,
    String placeholder = '',
    OnTextChanged? onTextChanged,
    OnTextChanged? onTextSubmitted,
    bool isError = false,
    Color? hintColor,
    Color? textColor,
    double borderRadius = 4,
    Color enabledBorderColor = AppColor.gray30,
    Color disabledBorderColor = AppColor.gray20,
    Color focusedBorderColor = AppColor.navy50,
    Color errorBorderColor = AppColor.red10,
    Color? fillColor,
    Widget? prefixWidget,
    Widget? suffixWidget,
    Color? prefixWidgetBackgroundColor,
    Color? suffixWidgetBackgroundColor,
    EdgeInsets? prefixWidgetMargin,
    EdgeInsets? suffixWidgetMargin,
    double? prefixWidgetMaxWidth,
    double? suffixWidgetMaxWidth,
    TextEditingController? textEditingController,
    EdgeInsets? inputPadding,
    TextInputAction? textInputAction,
  }) : super(
          key: key,
          textStyle: textStyle,
          placeholder: placeholder,
          isError: isError,
          onTextChanged: onTextChanged,
          onTextSubmitted: onTextSubmitted,
          maxLines: 1,
          hintColor: hintColor,
          textColor: textColor,
          borderRadius: borderRadius,
          enabledBorderColor: enabledBorderColor,
          disabledBorderColor: disabledBorderColor,
          focusedBorderColor: focusedBorderColor,
          errorBorderColor: errorBorderColor,
          fillColor: fillColor,
          prefixWidget: prefixWidget,
          suffixWidget: suffixWidget,
          prefixWidgetBackgroundColor: prefixWidgetBackgroundColor,
          suffixWidgetBackgroundColor: suffixWidgetBackgroundColor,
          prefixWidgetMargin: prefixWidgetMargin,
          suffixWidgetMargin: suffixWidgetMargin,
          prefixWidgetMaxWidth: prefixWidgetMaxWidth,
          suffixWidgetMaxWidth: suffixWidgetMaxWidth,
          textEditingController: textEditingController,
          inputPadding: inputPadding,
          textInputAction: textInputAction,
        );

  @override
  List<TextInputFormatter>? inputFormatters() => [
        inputType == InputType.number
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.singleLineFormatter,
      ];

  @override
  bool isObscureTextEnabled() => inputType == InputType.password;

  @override
  TextInputType? textInputType() {
    return inputType == InputType.number
        ? TextInputType.phone
        : TextInputType.text;
  }
}
