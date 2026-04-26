import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calculator/main.dart';

void main() {
  testWidgets('Calculator adds two numbers', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Calc()));

    await tester.tap(find.text('1'));
    await tester.tap(find.text('+'));
    await tester.tap(find.text('2'));
    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.text('3.0'), findsOneWidget);
  });
}
