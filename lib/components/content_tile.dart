import 'package:flutter/material.dart';
import 'package:goggle_keep_copy/models/content.dart';

class ContentTile extends StatelessWidget {
  final Content content;

  ContentTile({this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            content.title,
          ),
          Text(
            content.text,
          ),
        ],
      ),
    );
  }
}
