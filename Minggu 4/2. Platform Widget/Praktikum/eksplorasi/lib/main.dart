import 'package:eksplorasi/soal_eksplorasi_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // brightness: Brightness.dark,
        primaryColor: const Color(0xFF6200EE),
        secondaryHeaderColor: const Color(0xFF03DAC5),
      ),
      // home: const HomePage(),
      home: const SoalEksplorasiPage(),
    );
  }
}
