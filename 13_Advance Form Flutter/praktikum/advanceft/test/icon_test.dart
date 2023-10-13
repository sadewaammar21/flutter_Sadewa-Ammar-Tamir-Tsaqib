import 'package:advanceft/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Icon nya adalah', (WidgetTester tester) async {
    // Bangun widget yang berisi ikon
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    // Verifikasi apakah ikon telah ditampilkan
    expect(find.byIcon(Icons.mobile_friendly), findsOneWidget);
  });
}
