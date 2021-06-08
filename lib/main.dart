import 'package:flutter/material.dart';
import 'package:goggle_keep_copy/screens/home_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.white,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
