import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_api/models/image_generator_model.dart';
import 'package:tugas_api/screens/home/home_screen.dart';
import 'package:tugas_api/screens/home/home_screen_model.dart';
import 'package:tugas_api/screens/image_generator/image_generator_screen.dart';
import 'package:tugas_api/screens/image_generator/image_generator_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => ImageGeneratorViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        // home: const HomeScreen(),
        initialRoute: "/home",
        routes: {
          "/home": (context) => const HomeScreen(),
          "/image-generator": (context) => const ImageGeneratorScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
