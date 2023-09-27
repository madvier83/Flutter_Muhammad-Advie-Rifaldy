import 'package:flutter/material.dart';
import 'package:tugas_12/screens/advance_form_contact.dart';
import 'package:tugas_12/screens/gallery_detail_screen.dart';
import 'package:tugas_12/screens/gallery_screen.dart';

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
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      // home: GalleryScreen(),
      initialRoute: "/",
      routes: {
        "/": (context) => const GalleryScreen(),
        "/galleryDetail": (context) => const GalleryDetail(),
        "/contact": (context) => const AdvanceFormContact(),
      },
    );
  }
}
