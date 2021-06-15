import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goggle_keep_copy/models/unique_content_id.dart';
import 'package:goggle_keep_copy/screens/edit_content_image/edit_content_image_screen.dart';
import 'package:goggle_keep_copy/services/image_file_loader.dart';
import 'package:goggle_keep_copy/utils/string_extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'edit_content_controller.dart';

class EditContentScreen extends HookWidget {
  EditContentScreen({required this.uniqueContentId});

  final UniqueContentId uniqueContentId;
  final titleTextController = TextEditingController();
  final memoTextController = TextEditingController();
  ImageProvider? _selectedImage;

  @override
  Widget build(BuildContext context) {
    final controller =
        useProvider(editContentProvider(uniqueContentId).notifier);
    final content = useProvider(editContentProvider(uniqueContentId)).content;

    titleTextController.text = content.title;
    memoTextController.text = content.text;

    void updateContent() {
      var title = titleTextController.text;
      var memo = memoTextController.text;

      title = title.isNotBlank ? title : '';
      memo = memo.isNotBlank ? memo : '';

      var images = [...content.images];
      if (_selectedImage != null) {
        images.add(_selectedImage!);
      } else {
        images = [...content.images];
      }

      final newContent =
          content.copyWith(title: title, text: memo, images: images);
      controller.update(newContent);
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(),
        elevation: 0,
        leading: IconButton(
          icon: const BackButtonIcon(),
          onPressed: () {
            updateContent();
            Navigator.pop(context);
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.push_pin_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add_alert_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.archive_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: 1000,
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: content.images.asMap().entries.map(
                    (entry) {
                      final index = entry.key;
                      final imageProvider = entry.value;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push<int>(
                              context,
                              MaterialPageRoute(
                                builder: (_) {
                                  return EditContentImageScreen(
                                    id: uniqueContentId,
                                    shownImageIndex: index,
                                  );
                                },
                              ),
                            );
                          },
                          child: Image(image: imageProvider),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              TextField(
                controller: titleTextController,
                cursorColor: Colors.black,
                cursorWidth: 1,
                style: const TextStyle(
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                  hintText: 'タイトル',
                  border: InputBorder.none,
                ),
              ),
              TextField(
                controller: memoTextController,
                cursorColor: Colors.black,
                cursorWidth: 1,
                decoration: const InputDecoration(
                  hintText: 'メモ',
                  border: InputBorder.none,
                ),
                autofocus: true,
              ),
            ],
          ),
        ),
      ),
      // TODO(Kosei): アイコンの配置修正、真ん中を寄せる。
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.add_box_outlined),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (context) {
                    return ContentSelectionSheet(
                      onSelectImage: (imageProvider) {
                        if (imageProvider == null) {
                          throw ArgumentError.notNull(imageProvider.toString());
                        }

                        _selectedImage = imageProvider;
                        updateContent();
                        _selectedImage = null;
                      },
                    );
                  },
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.undo),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.redo),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ContentSelectionSheet extends StatelessWidget {
  const ContentSelectionSheet({
    required this.onSelectImage,
  });

  final Function(ImageProvider?) onSelectImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ListTile(
          leading: Icon(Icons.camera_alt_outlined),
          title: Text('写真を撮影'),
        ),
        ListTile(
          leading: const Icon(Icons.image_outlined),
          title: const Text('画像を追加'),
          onTap: () async {
            final loader = ImageFileLoader();
            final file = await loader.getImageFromStorage();
            if (file != null) {
              onSelectImage(FileImage(file));
            }
          },
        ),
        const ListTile(
          leading: Icon(Icons.brush_outlined),
          title: Text('図形描画'),
        ),
        const ListTile(
          leading: Icon(Icons.mic_none),
          title: Text('録音'),
        ),
        const ListTile(
          leading: Icon(Icons.check_box_outlined),
          title: Text('チェックボックス'),
        ),
      ],
    );
  }
}
