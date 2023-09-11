import 'package:flutter/material.dart';
import 'package:prioritas1/advance_form.dart';
import 'package:prioritas1/advance_form_contact.dart';
import 'package:prioritas1/contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ContactScreen(),
    const AdvanceForm(),
    const AdvanceFormContact(),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.contacts_outlined), label: "Form"),
            BottomNavigationBarItem(
                icon: Icon(Icons.file_present_outlined), label: "Advance Form"),
            BottomNavigationBarItem(
                icon: Icon(Icons.file_present_outlined),
                label: "Advance Form +"),
          ],
        ),
      ),
    );
  }
}
