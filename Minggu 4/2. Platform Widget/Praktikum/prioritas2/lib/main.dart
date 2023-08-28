import 'package:flutter/cupertino.dart';
import 'package:prioritas2/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'Cupertino App',
        home: HomePage());
  }
}
