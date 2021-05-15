import 'package:flutter/material.dart';

class Content {
  String title;
  String text;
  List<ImageProvider> imageProviders = [
    AssetImage('assets/monkey.jpg'),
    AssetImage('assets/monkey.jpg'),
    AssetImage('assets/monkey.jpg'),
  ];

  Content({
    this.title,
    this.text,
  });
}
