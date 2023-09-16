import 'package:flutter/material.dart';
import 'android_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData.dark(),
    );
  }
}
