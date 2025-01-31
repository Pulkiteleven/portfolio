import 'package:flutter/material.dart';

class Projectmodel {
  final String title;
  final String category;
  final String desc;
  final List<String> screenshots;
  final String icon;
  final String banner;
  final List<LinksModel> allLinks;

  Projectmodel({
    required this.title,
    required this.category,
    required this.desc,
    required this.screenshots,
    required this.icon,
    required this.banner,
    required this.allLinks,
  });
}

class LinksModel {
  final String title;
  final String icon;
  final String link;

  LinksModel({
    required this.title,
    required this.icon,
    required this.link,
  });
}
