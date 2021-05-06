import 'package:flutter/material.dart';
import 'package:goggle_keep_copy/screens/add_content_screen.dart';
import 'package:goggle_keep_copy/screens/edit_content_screen.dart';
import 'package:goggle_keep_copy/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.white,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomeScreen(),
        '/add': (BuildContext context) => AddContentScreen(),
        '/edit': (BuildContext context) => EditContentScreen(),
      },
    );
  }
}
