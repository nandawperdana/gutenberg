import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gutenberg/core/design/measurement/app_dimen.dart';
import 'package:gutenberg/core/design/molecule/form/text_field_base_mv.dart';
import 'package:gutenberg/core/design/style/app_color.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';

enum InputType { text, password, number }

abstract class InputTextBaseAV extends StatelessWidget {
  final String placeholder;

  final Widget? prefixWidget;

  final Widget? suffixWidget;

  final Color? prefixWidgetBackgroundColor;

  final Color? suffixWidgetBackgroundColor;

  final EdgeInsets? prefixWidgetMargin;

  final EdgeInsets? suffixWidgetMargin;

  final double? prefixWidgetMaxWidth;

  final double? suffixWidgetMaxWidth;

  final OnTextChanged? onTextChanged;

  final ValueChanged<String>? onTextSubmitted;

  final bool isError;

  final AppTextStyle textStyle;

  final int? maxLines;

  final Color? hintColor;

  final Color? textColor;

  final double borderRadius;

  final Color enabledBorderColor;

  final Color disabledBorderColor;

  final Color focusedBorderColor;

  final Color errorBorderColor;

  final Color? fillColor;

  final EdgeInsets? inputPadding;

  final TextEditingController? textEditingController;

  final TextInputAction? textInputAction;

  const InputTextBaseAV({
    Key? key,
    required this.textStyle,
    required this.placeholder,
    required this.isError,
    this.onTextChanged,
    this.onTextSubmitted,
    required this.maxLines,
    this.hintColor,
    this.textColor,
    required this.borderRadius,
    required this.enabledBorderColor,
    required this.disabledBorderColor,
    required this.focusedBorderColor,
    required this.errorBorderColor,
    this.fillColor,
    this.prefixWidget,
    this.suffixWidget,
    this.prefixWidgetBackgroundColor,
    this.suffixWidgetBackgroundColor,
    this.prefixWidgetMargin,
    this.suffixWidgetMargin,
    this.prefixWidgetMaxWidth,
    this.suffixWidgetMaxWidth,
    this.textEditingController,
    this.inputPadding,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: textInputType(),
      inputFormatters: inputFormatters(),
      textAlignVertical: TextAlignVertical.center,
      obscureText: isObscureTextEnabled(),
      style: TextStyle(
        fontSize: textStyle.fontSize,
        fontWeight: textStyle.fontWeight,
        color: textColor,
      ),
      cursorWidth: 1,
      cursorColor: Colors.black12,
      onChanged: onTextChanged,
      maxLines: maxLines,
      onFieldSubmitted: onTextSubmitted,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        isCollapsed: true,
        prefixIcon: prefixWidget != null
            ? Padding(
                padding: const EdgeInsets.all(1),
                child: Container(
                  alignment: Alignment.center,
                  margin: prefixWidgetMargin,
                  constraints:
                      BoxConstraints(maxWidth: prefixWidgetMaxWidth ?? 48),
                  decoration: BoxDecoration(
                    color: prefixWidgetBackgroundColor ?? AppColor.gray20,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppDimen.paddingExtraSmall),
                      bottomLeft: Radius.circular(AppDimen.paddingExtraSmall),
                    ),
                  ),
                  child: prefixWidget,
                ),
              )
            : null,
        suffixIcon: suffixWidget != null
            ? Padding(
                padding: const EdgeInsets.all(1),
                child: Container(
                  alignment: Alignment.center,
                  margin: suffixWidgetMargin,
                  constraints:
                      BoxConstraints(maxWidth: suffixWidgetMaxWidth ?? 48),
                  decoration: BoxDecoration(
                    color: suffixWidgetBackgroundColor ?? AppColor.gray10,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(AppDimen.paddingExtraSmall),
                      bottomRight: Radius.circular(AppDimen.paddingExtraSmall),
                    ),
                  ),
                  child: suffixWidget,
                ),
              )
            : null,
        hintText: placeholder,
        contentPadding: inputPadding ?? const EdgeInsets.all(16.0),
        hintStyle: TextStyle(
          fontSize: textStyle.fontSize,
          fontWeight: textStyle.fontWeight,
          color: hintColor,
        ),
        filled: fillColor != null,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: disabledBorderColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isError ? errorBorderColor : focusedBorderColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
    );
  }

  TextInputType? textInputType();

  List<TextInputFormatter>? inputFormatters();

  bool isObscureTextEnabled();
}
