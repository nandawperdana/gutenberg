import 'package:flutter/material.dart';

import 'package:gutenberg/core/design/atomic/image/image_base_av.dart';
import 'package:gutenberg/core/design/measurement/dimension.dart';

class ImageAV extends ImageBaseAV {
  const ImageAV({
    Key? key,
    String source = '',
    required this.dimension,
    this.boxFit,
    this.loadingPlaceholder,
    this.errorPlaceholder,
    Color? drawableColor,
    AlignmentGeometry alignment = Alignment.center,
  }) : super(key, source, drawableColor, alignment);

  @override
  final Dimension dimension;

  @override
  final BoxFit? boxFit;

  @override
  final Widget? loadingPlaceholder;

  @override
  final Widget? errorPlaceholder;
}
