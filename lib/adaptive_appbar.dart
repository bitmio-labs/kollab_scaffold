import 'package:flutter/material.dart';
import 'package:kollab_scaffold/model/config.dart';

import 'navbar_icon.dart';

const appBarDesktopHeight = 128.0;

class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ScaffoldConfigModel model;

  const AdaptiveAppBar({Key key, this.isDesktop = false, this.model})
      : super(key: key);

  final bool isDesktop;

  @override
  Size get preferredSize => isDesktop
      ? const Size.fromHeight(appBarDesktopHeight)
      : const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return AppBar(
        automaticallyImplyLeading: !isDesktop,
        title: isDesktop ? null : Text('My Title'),
        bottom: isDesktop
            ? PreferredSize(
                preferredSize: const Size.fromHeight(26),
                child: Container(
                  alignment: AlignmentDirectional.centerStart,
                  margin: const EdgeInsetsDirectional.fromSTEB(72, 0, 0, 22),
                  child: Text(
                    'My Title',
                    style: themeData.textTheme.headline6.copyWith(
                      color: themeData.colorScheme.onPrimary,
                    ),
                  ),
                ),
              )
            : null,
        actions: List.from(model.toolbar_items.map((e) => IconButton(
              icon: NavbarIcon(e.icon_name).icon,
              tooltip: e.title,
              onPressed: () {},
            ))));
  }
}
