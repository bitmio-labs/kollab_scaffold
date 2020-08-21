import 'package:flutter/material.dart';

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
