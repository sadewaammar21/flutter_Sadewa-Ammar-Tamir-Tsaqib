import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/screen/home_page.dart';

void main() {
  testWidgets('Deskripsi Nya .....', (WidgetTester tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    await expectLater(
        find.text("A dialog is a type of modal window that appears in"),
        findsNWidgets(1));
    await expectLater(
        find.text("front of app content to provide critical information, or"),
        findsNWidgets(1));
    await expectLater(
        find.text("prompt for a decision to be made"), findsNWidgets(1));
    handle.dispose();
  });
}
