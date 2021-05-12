import 'package:flutter/material.dart';

enum _Menu {
  extractTexts,
  send,
  delete,
}

class EditContentImageScreen extends StatefulWidget {
  final List<ImageProvider> imageProviders;

  EditContentImageScreen({this.imageProviders});

  @override
  _EditContentImageScreenState createState() => _EditContentImageScreenState();
}

class _EditContentImageScreenState extends State<EditContentImageScreen> {
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
          '${_shownImageIndex + 1}/${widget.imageProviders.length}',
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
          ImageEditPopupMenu(
            onSelected: (value) {
              switch (value) {
                case _Menu.extractTexts:
                  break;
                case _Menu.delete:
                  Navigator.pop(context, _shownImageIndex);
                  break;
                case _Menu.send:
                  break;
                default:
                  throw UnsupportedError(
                      '${value.toString()} is not supported.');
              }
            },
          ),
        ],
      ),
      body: ImagePageView(
        imageProviders: widget.imageProviders,
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
  final Function(_Menu) onSelected;

  ImageEditPopupMenu({this.onSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_Menu>(
      onSelected: onSelected,
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
