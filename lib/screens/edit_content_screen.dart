import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:goggle_keep_copy/models/content.dart';
import 'package:goggle_keep_copy/services/image_file_loader.dart';
import 'package:goggle_keep_copy/utils/string_extension.dart';

class EditContentScreen extends StatelessWidget {
  EditContentScreen({this.content}) {
    titleTextController.text = content.title;
    memoTextController.text = content.text;
  }

  final Content content;

  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController memoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(),
        elevation: 0,
        leading: IconButton(
          icon: BackButtonIcon(),
          onPressed: () {
            var title = titleTextController.text;
            var memo = memoTextController.text;

            content.title = title.isNotBlank ? title : '';
            content.text = memo.isNotBlank ? memo : '';

            Navigator.pop(
              context,
              content,
            );
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
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
              controller: titleTextController,
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
              controller: memoTextController,
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
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ContentSelectionSheet(content);
                  },
                );
              },
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

class ContentSelectionSheet extends StatelessWidget {
  final Content content;

  // TODO: Contentを直接渡さない方式にする。
  ContentSelectionSheet(this.content);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Icon(Icons.camera_alt_outlined),
          title: Text('写真を撮影'),
        ),
        ListTile(
          leading: Icon(Icons.image_outlined),
          title: Text('画像を追加'),
          onTap: () async {
            var loader = ImageFileLoader();
            var file = await loader.getImageFromStorage();
            if (file != null) {
              content.imageProvider = FileImage(file);
            }
          },
        ),
        ListTile(
          leading: Icon(Icons.brush_outlined),
          title: Text('図形描画'),
        ),
        ListTile(
          leading: Icon(Icons.mic_none),
          title: Text('録音'),
        ),
        ListTile(
          leading: Icon(Icons.check_box_outlined),
          title: Text('チェックボックス'),
        ),
      ],
    );
  }
}
