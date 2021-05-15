import 'package:flutter/material.dart';

enum _Menu {
  extractTexts,
  send,
  delete,
}

class EditContentImageScreen extends StatefulWidget {
  const EditContentImageScreen({
    this.imageProviders,
    this.shownImageIndex,
  });

  final List<ImageProvider> imageProviders;
  final int shownImageIndex;

  @override
  _EditContentImageScreenState createState() => _EditContentImageScreenState();
}

class _EditContentImageScreenState extends State<EditContentImageScreen> {
  int _shownImageIndex = 0;

  @override
  void initState() {
    _shownImageIndex = widget.shownImageIndex;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 1,
        leading: IconButton(
          icon: const BackButtonIcon(),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '${_shownImageIndex + 1}/${widget.imageProviders.length}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.brush_outlined,
            ),
            color: Colors.black,
            onPressed: () {},
          ),
          ImageEditPopupMenu(
            onSelected: (value) async {
              switch (value) {
                case _Menu.extractTexts:
                  break;
                case _Menu.delete:
                  final selected = await showDialog<int>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: const Text('画像を削除しますか'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 1);
                            },
                            child: const Text('キャンセル'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 2);
                            },
                            child: const Text('削除'),
                          ),
                        ],
                      );
                    },
                  );

                  switch (selected) {
                    case 1:
                      break;
                    case 2:
                      Navigator.pop(context, _shownImageIndex);
                      break;
                    default:
                      throw UnsupportedError('$selected is not supported}');
                  }
                  break;
                case _Menu.send:
                  break;
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
        initialPage: _shownImageIndex,
      ),
    );
  }
}

class ImageEditPopupMenu extends StatelessWidget {
  const ImageEditPopupMenu({this.onSelected});

  final Function(_Menu) onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_Menu>(
      onSelected: onSelected,
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: _Menu.extractTexts,
          child: Text('画像のテキストを抽出'),
        ),
        const PopupMenuItem(
          value: _Menu.send,
          child: Text('送信'),
        ),
        const PopupMenuItem(
          value: _Menu.delete,
          child: Text('削除'),
        ),
      ],
    );
  }
}

class ImagePageView extends StatelessWidget {
  const ImagePageView({
    this.imageProviders,
    this.onPageChanged,
    this.initialPage = 0,
  });

  final List<ImageProvider> imageProviders;
  final Function(int) onPageChanged;
  final int initialPage;

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: initialPage);
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      onPageChanged: onPageChanged,
      children: imageProviders.map((e) {
        return Center(
          child: Image(
            image: e,
          ),
        );
      }).toList(),
    );
  }
}
