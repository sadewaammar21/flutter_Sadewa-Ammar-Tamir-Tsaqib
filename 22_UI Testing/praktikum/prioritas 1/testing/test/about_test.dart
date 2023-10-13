import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/screen/home_page.dart';

void main() {
  testWidgets('Judul Nama harus..', (WidgetTester tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    var textField = find.byType(TextFormField);
    expect(textField, findsNWidgets(2));

    await expectLater(find.text("Contact"), findsNWidgets(1));
    handle.dispose();
  });
}
