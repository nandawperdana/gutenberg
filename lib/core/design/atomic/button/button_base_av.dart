import 'package:flutter/material.dart';

import 'package:gutenberg/core/design/atomic/text/text_av.dart';
import 'package:gutenberg/core/design/measurement/dimension.dart';
import 'package:gutenberg/core/design/molecule/shimmer/shimmer_mv.dart';
import 'package:gutenberg/core/design/style/app_button_style.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';

typedef OnTap = void Function();

abstract class ButtonBaseAV extends StatelessWidget {
  final String text;

  final Widget? prefixIcon;

  final Widget? suffixIcon;

  final Dimension? iconDimension;

  final bool isLoading;

  final bool isDisabled;

  final AppButtonStyle buttonStyle;

  final OnTap onTap;

  abstract final Dimension dimension;

  abstract final AppTextStyle textStyle;

  abstract final double padding;

  const ButtonBaseAV({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    this.iconDimension,
    required this.text,
    required this.isLoading,
    required this.isDisabled,
    required this.buttonStyle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Decoration? decoration;

    if (buttonStyle.buttonBorder != null) {
      final border = buttonStyle.buttonBorder!;
      decoration = BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(border.radius),
        ),
        border: Border.all(color: border.color, width: border.thickness),
      );
    }

    return Container(
      decoration: decoration,
      constraints: BoxConstraints(
        minHeight: dimension.height > 0 ? dimension.height : 0,
      ),
      child: Material(
        color: isDisabled
            ? buttonStyle.disabledButtonColor
            : buttonStyle.buttonColor,
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        child: InkWell(
          onTap: isDisabled
              ? null
              : isLoading
                  ? null
                  : onTap,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              padding,
              0,
              padding,
              0,
            ),
            child: Center(
              child: isLoading
                  ? ShimmerMV(height: dimension.height)
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (prefixIcon != null) ...[
                          prefixIcon ?? const SizedBox.shrink(),
                          const SizedBox.shrink(),
                        ],
                        Flexible(
                          child: TextAV(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: text,
                            color: isDisabled
                                ? buttonStyle.disabledTextColor
                                : buttonStyle.textColor,
                            style: textStyle,
                          ),
                        ),
                        if (suffixIcon != null) ...[
                          const SizedBox(width: 8),
                          suffixIcon ?? const SizedBox.shrink(),
                        ],
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
