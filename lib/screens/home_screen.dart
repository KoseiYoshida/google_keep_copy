import 'dart:io';
import 'package:flutter/material.dart';
import 'package:goggle_keep_copy/components/content_tile.dart';
import 'package:goggle_keep_copy/models/content.dart';
import 'package:goggle_keep_copy/screens/edit_content_screen.dart';
import 'package:goggle_keep_copy/services/image_file_loader.dart';
import 'package:quiver/iterables.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Content> contents = [
    for (final num in range(1, 5))
      Content(
        title: 'title$num',
        text: 'text$num',
      )
  ];

  Future<Content> openContentEditPage(Content passedContent) async {
    return Navigator.push<Content>(
      context,
      MaterialPageRoute(
        builder: (_) {
          return EditContentScreen(
            content: passedContent,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu),
                    // TextField(),
                    Row(
                      children: const [
                        Icon(
                          Icons.view_agenda_outlined,
                        ),
                        Icon(
                          Icons.account_circle_outlined,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  // 画像が大きいとはみ出てしまうので、一旦Aspectで調整
                  childAspectRatio: 0.5,
                ),
                itemBuilder: (context, index) {
                  final tile = ContentTile(content: contents[index]);
                  return GestureDetector(
                    onTap: () async {
                      final editedContent =
                          await openContentEditPage(contents[index]);

                      if (editedContent != null) {
                        setState(() {
                          contents[index] = editedContent;
                        });
                      }
                    },
                    child: tile,
                  );
                },
                itemCount: contents.length,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.check_box_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.brush_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.mic_none,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.image_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () async {
                    final selected = await showDialog<int>(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: const Text('画像を追加'),
                          children: [
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context, 1);
                              },
                              child: const ListTile(
                                leading: Icon(Icons.camera_alt_outlined),
                                title: Text('写真を撮影'),
                              ),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context, 2);
                              },
                              child: const ListTile(
                                leading: Icon(Icons.image_outlined),
                                title: Text('画像を選択'),
                              ),
                            ),
                          ],
                        );
                      },
                    );

                    File selectedFile;

                    switch (selected) {
                      case 1:
                        print('写真を撮影');
                        break;
                      case 2:
                        final loader = ImageFileLoader();
                        selectedFile = await loader.getImageFromStorage();
                        break;
                      default:
                        throw ArgumentError.value(selected);
                    }

                    if (selectedFile != null) {
                      final newContent = Content()
                        ..imageProviders = [FileImage(selectedFile)];

                      final editedContent =
                          await openContentEditPage(newContent);

                      if (editedContent != null) {
                        setState(() {
                          contents.add(editedContent);
                        });
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () async {
            final createdContent = await openContentEditPage(Content());

            if (createdContent != null) {
              setState(() {
                contents.add(createdContent);
              });
            }
          },
          child: const Icon(
            Icons.add,
            size: 45,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
