import 'package:flutter/material.dart';
import 'package:formflt/login/login_screen.dart';
import './home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacs',
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        "/": (context) => const LoginScreen(),
        "/homePage": (context) => const HomePage(),
      },
    );
  }
}
