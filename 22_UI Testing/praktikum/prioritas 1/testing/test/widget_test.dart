import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/screen/home_page.dart';

void main() {
  testWidgets('Text Form Field ada 2....', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    var textField = find.byType(TextFormField);

    expect(textField, findsNWidgets(2));
  });
}
