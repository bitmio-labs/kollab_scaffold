// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/services.dart';

class ScaffoldConfigModel {
  String app_title;
  String app_subtitle;
  List<NavItemModel> toolbar_items;
  List<NavItemModel> nav_items;

  ScaffoldConfigModel(
      {this.app_title, this.app_subtitle, this.toolbar_items, this.nav_items});

  static Future<ScaffoldConfigModel> get example async {
    final string = await rootBundle
        .loadString('packages/kollab_scaffold/lib/model/config-example.json');
    final json = jsonDecode(string);
    return ScaffoldConfigModel.fromJson(json);
  }

  factory ScaffoldConfigModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> toolbar_items = json['toolbar_items'];
    final List<dynamic> nav_items = json['nav_items'];

    return ScaffoldConfigModel(
        app_title: json['app_title'],
        app_subtitle: json['app_subtitle'],
        toolbar_items: List<NavItemModel>.from(
            toolbar_items.map((each) => NavItemModel.fromJson(each))),
        nav_items: List<NavItemModel>.from(
            nav_items.map((each) => NavItemModel.fromJson(each))));
  }
}

class NavItemModel {
  String id;
  String title;
  String icon_name;
  String target;

  NavItemModel({this.id, this.title, this.icon_name, this.target});

  factory NavItemModel.fromJson(Map<String, dynamic> json) {
    return NavItemModel(
        id: json['id'],
        title: json['title'],
        icon_name: json['icon_name'],
        target: json['target']);
  }
}
