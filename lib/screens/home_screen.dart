import 'package:flutter/material.dart';
import 'package:goggle_keep_copy/components/content_tile.dart';
import 'package:goggle_keep_copy/models/content.dart';
import 'package:goggle_keep_copy/screens/edit_content_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Content> contents = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu),
                    // TextField(),
                    Row(
                      children: [
                        Icon(Icons.view_agenda_outlined),
                        Icon(Icons.account_circle_outlined),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  // 画像が大きいとはみ出てしまうので、一旦Aspectで調整
                  childAspectRatio: 0.5,
                ),
                itemBuilder: (context, index) {
                  final tile = ContentTile(content: contents[index]);
                  return GestureDetector(
                    child: tile,
                    onTap: () async {
                      var editedContent = await Navigator.push<Content>(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return EditContentScreen(
                              content: contents[index],
                            );
                          },
                        ),
                      );

                      if (editedContent != null) {
                        setState(() {
                          this.contents[index] = editedContent;
                        });
                      }
                    },
                  );
                },
                itemCount: contents.length,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.check_box_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.brush_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.mic_none,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.image_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            size: 45,
            color: Colors.red,
          ),
          onPressed: () async {
            var value = await Navigator.pushNamed(context, '/add');
            if (value != null) {
              if (!(value is Content)) {
                throw 'Invalid type variable passed from route /add. Passed type:${value.runtimeType}';
              }
              var content = value as Content;
              setState(() {
                this.contents.add(content);
              });
            }
          },
        ),
      ),
    );
  }
}
