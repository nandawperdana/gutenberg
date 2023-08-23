import 'package:flutter/material.dart';

import 'package:gutenberg/core/design/atomic/form/input_text_av.dart';
import 'package:gutenberg/core/design/atomic/form/input_text_base_av.dart';
import 'package:gutenberg/core/design/atomic/text/text_av.dart';
import 'package:gutenberg/core/design/style/app_color.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';

typedef OnTextChanged = void Function(String text);

enum InputTextVariant { normal, large }

abstract class TextFieldBaseMV extends StatelessWidget {
  final String label;

  final String placeholder;

  final String additionalInformation;

  final String errorMessage;

  final Widget? prefixWidget;

  final Widget? suffixWidget;

  final Color? suffixWidgetBackgroundColor;

  final Color? prefixWidgetBackgroundColor;

  final EdgeInsets? prefixWidgetMargin;

  final EdgeInsets? suffixWidgetMargin;

  final double? prefixWidgetMaxWidth;

  final double? suffixWidgetMaxWidth;

  final OnTextChanged? onTextChanged;

  final InputType inputType;

  final InputTextVariant inputTextVariant;

  final TextEditingController? textEditingController;

  final EdgeInsets? inputPadding;

  final int? maxLength;

  const TextFieldBaseMV({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.additionalInformation,
    required this.errorMessage,
    required this.inputType,
    required this.inputTextVariant,
    this.prefixWidget,
    this.suffixWidget,
    this.prefixWidgetBackgroundColor,
    this.suffixWidgetBackgroundColor,
    this.prefixWidgetMargin,
    this.suffixWidgetMargin,
    this.prefixWidgetMaxWidth,
    this.suffixWidgetMaxWidth,
    this.onTextChanged,
    this.textEditingController,
    this.inputPadding,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isError = errorMessage.isNotEmpty;

    final isContainAdditionalInformation = additionalInformation.isNotEmpty;

    final inputTextStyle = inputTextVariant == InputTextVariant.large
        ? AppText.body16
        : AppText.body14;

    int currentLength = textEditingController?.text.length ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextAV(text: label, style: AppText.body14),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Theme(
            data: Theme.of(context).copyWith(
              primaryColor: AppColor.navy50,
            ),
            child: InputTextAV(
              inputType: inputType,
              placeholder: placeholder,
              prefixWidget: prefixWidget,
              suffixWidget: suffixWidget,
              prefixWidgetBackgroundColor: prefixWidgetBackgroundColor,
              suffixWidgetBackgroundColor: suffixWidgetBackgroundColor,
              prefixWidgetMargin: prefixWidgetMargin,
              suffixWidgetMargin: suffixWidgetMargin,
              prefixWidgetMaxWidth: prefixWidgetMaxWidth,
              suffixWidgetMaxWidth: suffixWidgetMaxWidth,
              onTextChanged: onTextChanged,
              isError: isError,
              textStyle: inputTextStyle,
              textEditingController: textEditingController,
              inputPadding: inputPadding,
            ),
          ),
        ),
        if (isContainAdditionalInformation || isError || maxLength != null)
          const SizedBox(height: 8),
        Row(
          children: [
            if (isContainAdditionalInformation && !isError)
              Expanded(
                child: TextAV(
                  text: additionalInformation,
                  style: AppText.caption12,
                  color: AppColor.gray80,
                ),
              ),
            if (isError)
              Expanded(
                child: TextAV(
                  text: errorMessage,
                  style: AppText.caption12,
                  color: AppColor.red60,
                ),
              ),
            if (maxLength != null)
              Expanded(
                child: TextAV(
                  text: '$currentLength/$maxLength',
                  style: AppText.caption12,
                  color: AppColor.gray80,
                  align: TextAlign.end,
                ),
              )
          ],
        ),
      ],
    );
  }
}
