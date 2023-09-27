import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_12/bloc/counter/counter_bloc.dart';
import 'package:tugas_12/bloc/contact/contact_bloc.dart';
import 'package:tugas_12/screens/bloc_provider_test.dart';
import 'package:tugas_12/screens/contact/contact_advance.dart';
import 'package:tugas_12/screens/gallery_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<ContactBloc>(create: (context) => ContactBloc())
      ],
      child: MaterialApp(
        locale: const Locale("id"),
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
          // "/contact": (context) => const ContactAdvance(),
          // "/counter": (context) => const CounterProvider(),
          // "/contactProvider": (context) => const StateProvider(),
          "/counterBloc": (context) => const BlocScreen(),
          "/contact": (context) => const ContactAdvanceBloc(),
        },
      ),
    );
  }
}
