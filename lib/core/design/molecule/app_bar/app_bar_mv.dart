import 'package:flutter/material.dart';

import 'package:feather_icons/feather_icons.dart';

import 'package:gutenberg/core/design/atomic/button/button_base_av.dart';
import 'package:gutenberg/core/design/measurement/app_dimen.dart';
import 'package:gutenberg/core/design/style/app_color.dart';

class AppBarMV extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMV({
    Key? key,
    this.title,
    this.backgroundColor = AppColor.systemWhite,
    this.bottom,
    this.leading,
    this.onLeadingTap,
    this.leadingIcon,
  }) : super(key: key);

  /// See [AppBar.title]
  final Widget? title;

  /// See [AppBar.backgroundColor]
  final Color? backgroundColor;

  /// See [AppBar.bottom]
  final PreferredSizeWidget? bottom;

  /// See [AppBar.leading]
  final Widget? leading;

  /// Set the icon for default leading widget
  final Widget? leadingIcon;

  /// Set the callback when default leading icon is clicked
  final OnTap? onLeadingTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? DefaultTextStyle.merge(
              style: Theme.of(context).textTheme.displayMedium,
              overflow: TextOverflow.ellipsis,
              child: title ?? const SizedBox(),
            )
          : null,
      leading: IconButton(
        splashRadius: AppDimen.radiusMedium,
        icon: leadingIcon ??
            const Icon(
              FeatherIcons.arrowLeft,
              color: AppColor.gray100,
            ),
        tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        onPressed: () {
          if (onLeadingTap != null) {
            onLeadingTap?.call();
          } else {
            Navigator.maybePop(context);
          }
        },
      ),
      bottom: bottom,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
