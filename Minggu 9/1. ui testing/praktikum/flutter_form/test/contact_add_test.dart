import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prioritas1/contact.dart';

void main() {
  testWidgets(
    'Test Add Contact',
    (WidgetTester tester) async {
      // ADD WIDGET
      await tester.pumpWidget(
        const MaterialApp(
          home: ContactScreen(),
        ),
      );

      // TEST SUBMIT CONTACT
      final nameTextFieldFinder = find.widgetWithText(TextField, 'Name');
      final phoneTextFieldFinder = find.widgetWithText(TextField, 'Phone');
      final submitButton = find.widgetWithText(FilledButton, 'Submit');
      expect(nameTextFieldFinder, findsOneWidget);
      expect(phoneTextFieldFinder, findsOneWidget);
      expect(submitButton, findsOneWidget);
      await tester.enterText(nameTextFieldFinder, 'Advie Rifaldy');
      await tester.enterText(phoneTextFieldFinder, '0823769399999');

      await tester.tap(submitButton);
      await tester.pump();

      expect(find.widgetWithText(ListTile, "Advie Rifaldy"), findsOneWidget);
    },
  );
}
