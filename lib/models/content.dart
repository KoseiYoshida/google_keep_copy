import 'package:flutter/material.dart';

class Content {
  Content({
    this.title,
    this.text,
  });

  String title;
  String text;
  List<ImageProvider> imageProviders = [
    const AssetImage('assets/monkey.jpg'),
    const AssetImage('assets/monkey.jpg'),
    const AssetImage('assets/monkey.jpg'),
  ];
}
