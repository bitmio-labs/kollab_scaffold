import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kollab_scaffold/model/config.dart';

import 'adaptive_appbar.dart';
import 'layout/adaptive.dart';
import 'sidebar.dart';

class KollabScaffold extends StatelessWidget {
  final ScaffoldConfigModel model;
  final String activeNavbarItem;

  const KollabScaffold({this.model, this.activeNavbarItem});

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
          Sidebar(model: model),
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
        drawer: Sidebar(model: model),
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
