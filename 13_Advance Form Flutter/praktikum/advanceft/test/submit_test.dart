import 'package:advanceft/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Tombolnya adalah', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));
    var elevatedbutton = find.byType(ElevatedButton);

    expect(elevatedbutton, findsNWidgets(1));
  });
}
