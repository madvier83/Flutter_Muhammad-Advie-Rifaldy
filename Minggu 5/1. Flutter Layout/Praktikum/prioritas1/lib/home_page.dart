import 'package:flutter/material.dart';
import 'package:prioritas1/models/contact_model.dart';
import 'package:prioritas1/widgets/contact_list.dart';
import 'package:prioritas1/widgets/main_bottom_navigation_bar.dart';
import 'package:prioritas1/widgets/main_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Contact> contacts = [
    Contact(
      name: "Muhammad Advie Rifaldy",
      phone: "+62-823 7693 2445",
    ),
    Contact(
      name: "Leanne Graham",
      phone: "+62-823 7693 2445",
    ),
    Contact(
      name: "Ervin Howell",
      phone: "+62-823 7693 2445",
    ),
    Contact(
      name: "Celementre Bauch",
      phone: "+62-823 7693 2445",
    ),
    Contact(
      name: "MPatricia Lebsack",
      phone: "+62-823 7693 2445",
    ),
    Contact(
      name: "Chelsey Dietrich",
      phone: "+62-823 7693 2445",
    ),
    Contact(
      name: "MMrs.Dennis Schulist",
      phone: "+62-823 7693 2445",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Material App"),
      ),
      drawer: const MainDrawer(),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ContactList(contact: contacts[index]);
        },
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
