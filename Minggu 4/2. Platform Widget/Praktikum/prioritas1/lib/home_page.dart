import 'package:flutter/material.dart';
import 'package:prioritas1/widgets/contact_list.dart';
import 'package:prioritas1/widgets/main_bottom_navigation_bar.dart';
import 'package:prioritas1/widgets/main_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Material App"),
      ),
      drawer: const MainDrawer(),
      body: ListView(
        children: const [
          ContactList(
            title: "Muhammad Advie Rifaldy",
            subtitle: "+62-823 7693 2445",
          ),
          ContactList(
            title: "Leanne Graham",
            subtitle: "+62-823 7693 2445",
          ),
          ContactList(
            title: "Ervin Howell",
            subtitle: "+62-823 7693 2445",
          ),
          ContactList(
            title: "Celementre Bauch",
            subtitle: "+62-823 7693 2445",
          ),
          ContactList(
            title: "MPatricia Lebsack",
            subtitle: "+62-823 7693 2445",
          ),
          ContactList(
            title: "Chelsey Dietrich",
            subtitle: "+62-823 7693 2445",
          ),
          ContactList(
            title: "MMrs.Dennis Schulist",
            subtitle: "+62-823 7693 2445",
          ),
        ],
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
