import 'package:flutter/material.dart';

class Iconmodel {
  final String title;
  final String image;
  final VoidCallback click;
  final bool link;


  Iconmodel({
    required this.title,
    required this.image,
    required this.click,
    required this.link
  });
}
