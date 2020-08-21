import 'package:flutter/material.dart';

import 'model/config.dart';
import 'navbar_icon.dart';

class Sidebar extends StatefulWidget {
  final ScaffoldConfigModel model;
  final String activeNavbarItem;

  Sidebar({this.model, this.activeNavbarItem});

  @override
  _SidebarState createState() => _SidebarState(activeNavbarItem);
}

class _SidebarState extends State<Sidebar> {
  String activeNavbarItem;

  _SidebarState(this.activeNavbarItem);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                widget.model.app_title,
                style: textTheme.headline6,
              ),
              subtitle: Text(
                widget.model.app_subtitle,
                style: textTheme.bodyText2,
              ),
            ),
            const Divider(),
            ...widget.model.nav_items.map((e) => ListTile(
                  enabled: true,
                  selected: activeNavbarItem != null
                      ? activeNavbarItem == e.id
                      : e.id == widget.model.nav_items.first.id,
                  leading: NavbarIcon(e.icon_name).icon,
                  title: Text(e.title),
                  onTap: () {
                    setState(() {
                      activeNavbarItem = e.id;
                    });
                  },
                ))
          ],
        ),
      ),
    );
  }
}
