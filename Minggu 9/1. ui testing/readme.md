# UI TESTING
Ini adalah pengujian yang fokus pada pengujian widget individu atau widget tree dalam aplikasi. Pengujian ini dapat memeriksa apakah widget berperilaku sesuai yang diharapkan.

Cohton ui testing pada flutter

Install dependency flutter test
```
flutter_test:
    sdk: flutter
```

Buat file testing
Dalam folder test buat sebuah file dengan nama test yang berakhir dengan tulisan _test.dart, isi dari file tersebut yaitu sebuah function main untuk dijalankan saat flutter test
```
void main() {
  testWidgets(
    'Test Contact Screen',
    (WidgetTester tester) async {
      // ADD WIDGET
      await tester.pumpWidget(
        const MaterialApp(
          home: ContactScreen(),
        ),
      );

      // TEST UI
      expect(find.byIcon(Icons.contacts_outlined), findsOneWidget);

      expect(find.text("Contact"), findsOneWidget);
      expect(find.text("Create New Contact"), findsOneWidget);
      expect(find.text("List Contacts"), findsOneWidget);

      expect(
        find.text("Submit"),
        findsOneWidget,
      );
  )
}
```

Untuk menjalankan seluruh test pada folder test maka run flutter test pada terminal
```
PS E:\Minggu 9\1. ui testing\praktikum\flutter_form> flutter test

00:02 +1: E:/Minggu 9/1. ui testing/praktikum/flutter_form/test/contact_add_test.dart: Test Add Contact
[{title: M Advie Rifaldy, subtitle: 082376932445}, {title: Advie Rifaldy, subtitle: 0823769399999}]
00:02 +2: E:/Minggu 9/1. ui testing/praktikum/flutter_form/test/contact_screen_test.dart: Test Contact Screen
[{title: M Advie Rifaldy, subtitle: 082376932445}, {title: Advie Rifaldy, subtitle: 0823769399999}]
00:02 +3: All tests passed!

PS E:\Minggu 9\1. ui testing\praktikum\flutter_form>
```

Jika berhasil maka akan muncul text All tests passed!

Tetapi jika ada test yang gagal maka akan muncul pemberitahuan test bagian mana yang tidak sesuai.

