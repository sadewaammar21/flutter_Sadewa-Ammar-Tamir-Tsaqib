import 'package:flutter/material.dart';

class HalamanImage extends StatelessWidget {
  const HalamanImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Background.jpg'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
