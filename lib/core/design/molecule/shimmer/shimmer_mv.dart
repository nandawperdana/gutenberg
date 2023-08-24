import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'package:gutenberg/core/design/measurement/app_dimen.dart';
import 'package:gutenberg/core/design/style/app_color.dart';

class ShimmerMV extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsets padding;
  final Color? baseColor;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;

  const ShimmerMV({
    super.key,
    this.width,
    this.height,
    this.padding = EdgeInsets.zero,
    this.baseColor,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Shimmer.fromColors(
        baseColor: baseColor ?? AppColor.grey,
        highlightColor: Colors.white,
        enabled: true,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius ??
                const BorderRadius.all(
                  Radius.circular(AppDimen.radiusMedium),
                ),
            color: backgroundColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
