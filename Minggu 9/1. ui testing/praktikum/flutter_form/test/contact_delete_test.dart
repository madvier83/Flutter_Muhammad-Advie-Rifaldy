import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prioritas1/contact.dart';

void main() {
  testWidgets(
    'Test Delete Contact',
    (WidgetTester tester) async {
      // ADD WIDGET
      await tester.pumpWidget(
        const MaterialApp(
          home: ContactScreen(),
        ),
      );

      // TEST DELETE CONTACT
      final deleteButton =
          find.widgetWithIcon(IconButton, Icons.delete_outline);
      expect(deleteButton, findsOneWidget);

      await tester.tap(deleteButton);
      await tester.pump();
    },
  );
}
