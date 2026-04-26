import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ui_app/main.dart';

void main() {
  testWidgets('Home page shows submitted name', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    await tester.enterText(find.byType(TextField), 'Yash');
    await tester.tap(find.text('Submit'));
    await tester.pump();

    expect(find.text('Hello Yash'), findsOneWidget);
  });
}
