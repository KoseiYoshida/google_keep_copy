import 'package:flutter/material.dart';

enum _Menu {
  extractTexts,
  send,
  delete,
}

class EditContentImageScreen extends StatefulWidget {
  @override
  _EditContentImageScreenState createState() => _EditContentImageScreenState();
}

class _EditContentImageScreenState extends State<EditContentImageScreen> {
  final List<ImageProvider> imageProviders = [
    AssetImage('assets/monkey.jpg'),
    AssetImage('assets/monkey.jpg'),
    AssetImage('assets/monkey.jpg'),
  ];

  int _shownImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 1,
        leading: IconButton(
          icon: BackButtonIcon(),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '${_shownImageIndex + 1}/${imageProviders.length}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.brush_outlined,
            ),
            color: Colors.black,
            onPressed: () {},
          ),
          ImageEditPopupMenu(),
        ],
      ),
      body: ImagePageView(
        imageProviders: imageProviders,
        onPageChanged: (value) {
          setState(() {
            _shownImageIndex = value;
          });
        },
      ),
    );
  }
}

class ImageEditPopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_Menu>(
      onSelected: (value) {
        print(value);
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: _Menu.extractTexts,
          child: Text('画像のテキストを抽出'),
        ),
        PopupMenuItem(
          value: _Menu.send,
          child: Text('送信'),
        ),
        PopupMenuItem(
          value: _Menu.delete,
          child: Text('削除'),
        ),
      ],
    );
  }
}

class ImagePageView extends StatelessWidget {
  ImagePageView({
    this.imageProviders,
    this.onPageChanged,
  });

  final List<ImageProvider> imageProviders;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: imageProviders.map((e) {
        return Center(
          child: Image(
            image: e,
          ),
        );
      }).toList(),
      onPageChanged: onPageChanged,
    );
  }
}
