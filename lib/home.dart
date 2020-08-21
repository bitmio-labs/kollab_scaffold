import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kollab_scaffold/model/config.dart';

import 'layout/adaptive.dart';

const appBarDesktopHeight = 128.0;

class NavbarIcon {
  final String name;

  NavbarIcon(this.name);

  IconData get iconData {
    switch (name) {
      case "favorite":
        return Icons.favorite;
      case "settings":
        return Icons.settings;
      case "inbox":
        return Icons.inbox;
      case "dashboard":
        return Icons.dashboard;
      case "person":
        return Icons.person;
      case "people":
        return Icons.people;
      case "share":
        return Icons.share;
      case "search":
        return Icons.search;
      default:
        return null;
    }
  }

  Icon get icon => iconData != null ? Icon(iconData) : null;
}

class HomePage extends StatelessWidget {
  final ScaffoldConfigModel model;

  const HomePage({this.model});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final isDesktop = isDisplayDesktop(context);
    final body = SafeArea(
      child: Padding(
        padding: isDesktop
            ? const EdgeInsets.symmetric(horizontal: 72, vertical: 48)
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Headline',
              style: textTheme.headline3.copyWith(
                color: colorScheme.onSecondary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'My Subtitle',
              style: textTheme.subtitle1,
            ),
            const SizedBox(height: 48),
            Text(
              'My body goes here.',
              style: textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );

    if (isDesktop) {
      return Row(
        children: [
          ListDrawer(model: model),
          const VerticalDivider(width: 1),
          Expanded(
            child: Scaffold(
              appBar: AdaptiveAppBar(isDesktop: true, model: model),
              body: body,
              floatingActionButton: FloatingActionButton.extended(
                heroTag: 'Extended Add',
                onPressed: () {},
                label: Text(
                  'Add',
                  style: TextStyle(color: colorScheme.onSecondary),
                ),
                icon: Icon(Icons.add, color: colorScheme.onSecondary),
                tooltip: 'Add new item.',
              ),
            ),
          ),
        ],
      );
    } else {
      return Scaffold(
        appBar: AdaptiveAppBar(model: model),
        body: body,
        drawer: ListDrawer(model: model),
        floatingActionButton: FloatingActionButton(
          heroTag: 'Add',
          onPressed: () {},
          tooltip: 'Add new item',
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      );
    }
  }
}

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

class ListDrawer extends StatefulWidget {
  final ScaffoldConfigModel model;

  ListDrawer({this.model});

  @override
  _ListDrawerState createState() => _ListDrawerState();
}

class _ListDrawerState extends State<ListDrawer> {
  static final numItems = 9;

  String selectedItem;

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
                  selected: selectedItem != null
                      ? selectedItem == e.id
                      : e.id == widget.model.nav_items.first.id,
                  leading: NavbarIcon(e.icon_name).icon,
                  title: Text(e.title),
                  onTap: () {
                    setState(() {
                      selectedItem = e.id;
                    });
                  },
                ))
          ],
        ),
      ),
    );
  }
}
