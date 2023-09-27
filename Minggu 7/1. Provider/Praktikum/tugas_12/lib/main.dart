import 'package:flutter/material.dart';
import 'package:tugas_12/screens/contact/contact_advance.dart';
import 'package:tugas_12/screens/state_provider_screen.dart';
import 'package:tugas_12/screens/gallery_screen.dart';
import 'package:tugas_12/screens/counter_setstate.dart';
import 'package:provider/provider.dart';
import 'package:tugas_12/stores/contact.dart' as contact_store;
import 'package:tugas_12/stores/contact_advance.dart' as contact_advance_store;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => contact_store.Contact(),
        ),
        ChangeNotifierProvider(
          create: (context) => contact_advance_store.ContactAdvanceStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        // home: GalleryScreen(),
        initialRoute: "/contact",
        routes: {
          "/": (context) => const GalleryScreen(),
          "/contact": (context) => const ContactAdvanceProvider(),
          "/counter": (context) => const CounterProvider(),
          "/contactProvider": (context) => const StateProvider(),
        },
      ),
    );
  }
}
