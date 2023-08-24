import 'package:flutter/material.dart';

import 'package:feather_icons/feather_icons.dart';

import 'package:gutenberg/core/design/atomic/form/input_text_av.dart';
import 'package:gutenberg/core/design/atomic/form/input_text_base_av.dart';
import 'package:gutenberg/core/design/measurement/app_dimen.dart';
import 'package:gutenberg/core/design/style/app_color.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';

class SearchBarMV extends StatelessWidget {
  final TextEditingController? controller;
  final String placeholder;
  final ValueChanged<String>? onSearch;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;

  const SearchBarMV({
    this.controller,
    required this.placeholder,
    this.onSearch,
    this.onChanged,
    this.suffixIcon,
    this.textInputAction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.gray70,
        borderRadius: BorderRadius.circular(AppDimen.radiusMedium),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 5),
            blurRadius: AppDimen.radiusSmall,
            color: Colors.grey.withOpacity(0.2),
          )
        ],
      ),
      child: InputTextAV(
        inputType: InputType.text,
        textStyle: AppText.body14,
        textEditingController: controller,
        onTextChanged: onChanged,
        onTextSubmitted: onSearch,
        textInputAction: textInputAction ?? TextInputAction.search,
        placeholder: placeholder,
        borderRadius: AppDimen.radiusMedium,
        suffixWidget: suffixIcon ??
            const Icon(
              FeatherIcons.search,
              color: Colors.black45,
            ),
        fillColor: AppColor.systemOffWhite,
      ),
    );
  }
}
