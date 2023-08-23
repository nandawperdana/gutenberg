import 'package:flutter/material.dart';

import 'package:gutenberg/core/design/atomic/button/button_base_av.dart';

class IconAV extends StatelessWidget {
  final IconData icon;

  final double? size;

  final Color? color;

  final OnTap? onPressed;

  const IconAV({
    Key? key,
    required this.icon,
    this.size,
    this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }
}
