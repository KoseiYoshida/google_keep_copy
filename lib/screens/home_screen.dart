import 'package:flutter/material.dart';
import 'package:goggle_keep_copy/models/content.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Content> contents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.menu),
                  // TextField(),
                  SizedBox(
                    width: 310,
                  ),
                  Icon(Icons.view_agenda_outlined),
                  Icon(Icons.account_circle_outlined),
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
              ),
              itemBuilder: (context, index) {
                return ContentTile(content: contents[index]);
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
    );
  }
}
