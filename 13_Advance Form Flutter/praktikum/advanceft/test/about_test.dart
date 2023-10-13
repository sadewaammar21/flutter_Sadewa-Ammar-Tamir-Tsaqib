import 'package:advanceft/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Judul Nama harus..', (WidgetTester tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    var textField = find.byType(TextFormField);
    expect(textField, findsNWidgets(2));

    await expectLater(find.text("InteractiveWidgets"), findsNWidgets(1));
    handle.dispose();
  });
}
