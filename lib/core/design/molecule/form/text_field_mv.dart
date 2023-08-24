import 'package:flutter/material.dart';

import 'package:gutenberg/core/design/atomic/form/input_text_base_av.dart';
import 'package:gutenberg/core/design/molecule/form/text_field_base_mv.dart';

class TextFieldMV extends TextFieldBaseMV {
  const TextFieldMV({
    Key? key,
    required String label,
    String? placeholder,
    String? additionalInformation,
    String? errorMessage,
    Widget? prefixWidget,
    Widget? suffixWidget,
    int? maxLength,
    Color? prefixWidgetBackgroundColor,
    Color? suffixWidgetBackgroundColor,
    EdgeInsets? prefixWidgetMargin,
    EdgeInsets? suffixWidgetMargin,
    double? prefixWidgetMaxWidth,
    double? suffixWidgetMaxWidth,
    OnTextChanged? onTextChanged,
    InputType inputType = InputType.text,
    inputTextVariant = InputTextVariant.normal,
    TextEditingController? textEditingController,
    EdgeInsets? inputPadding,
  }) : super(
          key: key,
          label: label,
          placeholder: placeholder ?? '',
          additionalInformation: additionalInformation ?? '',
          errorMessage: errorMessage ?? '',
          prefixWidget: prefixWidget,
          suffixWidget: suffixWidget,
          maxLength: maxLength,
          prefixWidgetBackgroundColor: prefixWidgetBackgroundColor,
          suffixWidgetBackgroundColor: suffixWidgetBackgroundColor,
          prefixWidgetMargin: prefixWidgetMargin,
          suffixWidgetMargin: suffixWidgetMargin,
          prefixWidgetMaxWidth: prefixWidgetMaxWidth,
          suffixWidgetMaxWidth: suffixWidgetMaxWidth,
          inputType: inputType,
          onTextChanged: onTextChanged,
          inputTextVariant: inputTextVariant,
          textEditingController: textEditingController,
        );
}
