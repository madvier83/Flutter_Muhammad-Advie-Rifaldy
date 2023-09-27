import 'package:flutter/material.dart';
import 'package:flutter_storage/models/db_manager.dart';
import 'package:flutter_storage/screens/contact_screen.dart';
import 'package:flutter_storage/screens/home_screen.dart';
import 'package:flutter_storage/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DbManager(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
          ),
          initialRoute: "/login",
          routes: {
            "/login": (context) => const LoginScreen(),
            "/home": (context) => const HomeScreen(),
            "/contact": (context) => const ContactScreen(),
          }),
    );
  }
}
