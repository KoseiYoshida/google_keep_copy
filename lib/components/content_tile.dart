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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (content.imageProvider != null)
              Image(
                image: content.imageProvider,
                height: 50,
              ),
            Text(
              content.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              content.text,
            ),
          ],
        ),
      ),
    );
  }
}
