import 'dart:ui';

import 'package:flutter/material.dart';

class AddContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.push_pin_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add_alert_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.archive_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Column(
          children: [
            TextField(
              cursorColor: Colors.black,
              cursorWidth: 1,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: 'タイトル',
                border: InputBorder.none,
              ),
            ),
            TextField(
              cursorColor: Colors.black,
              cursorWidth: 1,
              decoration: InputDecoration(
                hintText: 'メモ',
                border: InputBorder.none,
              ),
              autofocus: true,
            ),
          ],
        ),
      ),
      // TODO: アイコンの配置修正、真ん中を寄せる。
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.add_box_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.undo),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.redo),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
