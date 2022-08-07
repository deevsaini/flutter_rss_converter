import 'package:flutter/material.dart';
import 'package:rssbhargav/pages/tab_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deev Demo',
      home: HomePage(),
    );
  }
}
