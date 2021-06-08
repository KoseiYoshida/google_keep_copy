import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goggle_keep_copy/models/unique_content_id.dart';
import 'package:goggle_keep_copy/screens/edit_content_image_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum _Menu {
  extractTexts,
  send,
  delete,
}

class EditContentImageScreen extends HookWidget {
  EditContentImageScreen({
    required this.id,
    this.shownImageIndex = 0,
  });

  final UniqueContentId id;
  final int shownImageIndex;

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(editContentImageProvider(id).notifier);
    // controller.open(shownImageIndex);

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
          '${controller.currentIndex + 1}/${controller.length}',
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
                      controller.deleteCurrent();
                      Navigator.pop(context);
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
        imageProviders: useProvider(
            editContentImageProvider(id).select((value) => value.images)),
        onPageChanged: (value) {
          controller.open(value);
        },
        initialPage: controller.currentIndex,
      ),
    );
  }
}

class ImageEditPopupMenu extends StatelessWidget {
  const ImageEditPopupMenu({
    required this.onSelected,
  });

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
    required this.imageProviders,
    required this.onPageChanged,
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
