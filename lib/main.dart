import 'package:flutter/material.dart';
import 'package:thumbster/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thumbster Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const ThumbFight(
      //   changeValue: 15,
      // ),

      home: const HomePage(),
    );
  }
}
