import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('MaterialApp'),
      ),
      child: Center(
        child: Text('This is MaterialApp'),
      ),
    );
  }
}
