import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:form_app/main.dart';

void main() {
  testWidgets('Form validates empty fields', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: MyForm()));

    await tester.tap(find.text('Submit'));
    await tester.pump();

    expect(find.text('Enter name'), findsOneWidget);
    expect(find.text('Invalid phone'), findsOneWidget);
    expect(find.text('Enter DOB'), findsOneWidget);
  });
}
