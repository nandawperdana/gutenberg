import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:gutenberg/core/design/atomic/text/text_av.dart';
import 'package:gutenberg/core/design/measurement/dimension.dart';
import 'package:gutenberg/core/design/style/app_color.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';
import 'package:gutenberg/core/ext/context.dart';

abstract class ImageBaseAV extends StatelessWidget {
  /// It can be used if we want to load from local asset
  /// e.g. 'asset/tree.jpg'
  ///
  /// And if we want to load from server using http or https
  /// e.g. https://google.com/blackpink.jpg
  final String source;

  abstract final Dimension dimension;

  abstract final BoxFit? boxFit;

  abstract final Widget? loadingPlaceholder;

  abstract final Widget? errorPlaceholder;

  final Color? color;

  final AlignmentGeometry alignment;

  const ImageBaseAV(
    Key? key,
    this.source,
    this.color,
    this.alignment,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    frameBuilder(_, Widget child, int? frame, __) {
      if (frame == null) {
        return loadingPlaceholder ?? child;
      } else {
        return child;
      }
    }

    errorBuilder(_, __, ___) {
      return errorPlaceholder ?? _ErrorImage(dimension: dimension);
    }

    if (source.startsWith('http')) {
      // load from network
      return CachedNetworkImage(
        imageUrl: source,
        width: dimension.width,
        height: dimension.height,
        memCacheWidth: context.getImageCacheSize(dimension.width),
        memCacheHeight: context.getImageCacheSize(dimension.height),
        color: color,
        fit: boxFit,
        errorWidget: errorBuilder,
      );
    }
    return Image.asset(
      source,
      width: dimension.width > 0 ? dimension.width : null,
      height: dimension.height > 0 ? dimension.height : null,
      fit: boxFit,
      color: color,
      alignment: alignment,
      cacheWidth: context.getImageCacheSize(dimension.width),
      cacheHeight: context.getImageCacheSize(dimension.height),
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
    );
  }
}

class _ErrorImage extends StatelessWidget {
  final Dimension dimension;

  const _ErrorImage({
    Key? key,
    required this.dimension,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      return Container(
        width: dimension.width > 0 ? dimension.width : null,
        height: dimension.height > 0 ? dimension.height : null,
        color: Colors.redAccent,
        child: const TextAV(
          text: 'Image not found',
          style: AppText.caption08,
        ),
      );
    }

    return Container(
      width: dimension.width > 0 ? dimension.width : null,
      height: dimension.height > 0 ? dimension.height : null,
      color: AppColor.gray30,
    );
  }
}
