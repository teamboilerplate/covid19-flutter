import 'package:flutter/material.dart';

class FAQModel {
  final String title;
  final String description;
  bool isExpanded;

  FAQModel({
    @required this.title,
    @required this.description,
    this.isExpanded = false,
  });
}
