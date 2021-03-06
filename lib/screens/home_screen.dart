import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goggle_keep_copy/components/content_tile.dart';
import 'package:goggle_keep_copy/models/content.dart';
import 'package:goggle_keep_copy/models/controllers/unique_contents_controller.dart';
import 'package:goggle_keep_copy/models/unique_content_id.dart';
import 'package:goggle_keep_copy/models/unique_content.dart';
import 'package:goggle_keep_copy/screens/edit_content/edit_content_screen.dart';
import 'package:goggle_keep_copy/services/image_file_loader.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    void _openContentEditPage(UniqueContentId id) {
      Navigator.push<UniqueContent>(
        context,
        MaterialPageRoute(
          builder: (_) {
            return EditContentScreen(
              uniqueContentId: id,
            );
          },
        ),
      );
    }

    final controller = useProvider(uniqueContentsProvider.notifier);

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
              child: controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _GridViewContent(_openContentEditPage),
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
                          title: const Text('???????????????'),
                          children: [
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context, 1);
                              },
                              child: const ListTile(
                                leading: Icon(Icons.camera_alt_outlined),
                                title: Text('???????????????'),
                              ),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context, 2);
                              },
                              child: const ListTile(
                                leading: Icon(Icons.image_outlined),
                                title: Text('???????????????'),
                              ),
                            ),
                          ],
                        );
                      },
                    );

                    String? selectedFilePath;

                    switch (selected) {
                      case 1:
                        print('???????????????');
                        break;
                      case 2:
                        final loader = ImageFileLoader();
                        selectedFilePath = await loader.getImageFromStorage();
                        break;
                      default:
                        throw ArgumentError.value(selected);
                    }

                    if (selectedFilePath != null) {
                      final newContent = Content(
                        title: '',
                        text: '',
                        imagePaths: [selectedFilePath],
                      );

                      final id = controller.add(newContent);

                      _openContentEditPage(id);
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
          onPressed: () {
            final newContent = Content(
              title: '',
              text: '',
            );

            final id = controller.add(newContent);

            _openContentEditPage(id);
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

class _GridViewContent extends StatelessWidget {
  _GridViewContent(this.onContentTapped);

  final contents =
      useProvider(uniqueContentsProvider.select((value) => value.contents));

  final Function(UniqueContentId) onContentTapped;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        // ?????????????????????????????????????????????????????????Aspect?????????
        childAspectRatio: 0.5,
      ),
      itemBuilder: (context, index) {
        final tile = ContentTile(
          content: contents[index].content,
        );
        return GestureDetector(
          onTap: () {
            onContentTapped(contents[index].id);
          },
          child: tile,
        );
      },
      itemCount: contents.length,
    );
  }
}
