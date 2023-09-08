import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Hallo Alterra"),
      ),
      body: Center(
        child: Text("Nama saya adalah Sadewa Ammar Ta'mir Tsaqib"),
      ),
    ));
  }
}
