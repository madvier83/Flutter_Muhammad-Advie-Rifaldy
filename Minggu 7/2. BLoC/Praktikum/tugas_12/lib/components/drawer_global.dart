import 'package:flutter/material.dart';

class DrawerGlobal extends StatelessWidget {
  const DrawerGlobal({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        const SizedBox(height: 32),
        const Divider(),
        const ListTile(
          title: Text(
            "Assets, Dialog Bottomsheet, Navigation",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        ListTile(
          title: const Text("Gallery"),
          onTap: () {
            Navigator.of(context).pushNamed("/");
          },
        ),
        // ListTile(
        //   title: const Text("Contact"),
        //   onTap: () {
        //     Navigator.of(context).pushNamed("/contact");
        //   },
        // ),
        const Divider(),
        const ListTile(
          title: Text(
            "Flutter State Management",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        // ListTile(
        //   title: const Text("setState"),
        //   onTap: () {
        //     Navigator.of(context).pushNamed("/counter");
        //   },
        // ),
        // ListTile(
        //   title: const Text("State Management Provider"),
        //   onTap: () {
        //     Navigator.of(context).pushNamed("/contactProvider");
        //   },
        // ),
        // ListTile(
        //   title: const Text("Tugas State Management Provider"),
        //   onTap: () {
        //     Navigator.of(context).pushNamed("/contact");
        //   },
        // ),
        ListTile(
          title: const Text("State Management BLoC"),
          onTap: () {
            Navigator.of(context).pushNamed("/counterBloc");
          },
        ),
        ListTile(
          title: const Text("Tugas State Management BLoC"),
          onTap: () {
            Navigator.of(context).pushNamed("/contact");
          },
        ),
      ],
    ));
  }
}
