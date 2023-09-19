import 'package:flutter/material.dart';

class DrawerGlobal extends StatelessWidget {
  const DrawerGlobal({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        const SizedBox(height: 32),
        ListTile(
          title: const Text("Gallery"),
          onTap: () {
            Navigator.of(context).pushNamed("/");
          },
        ),
        ListTile(
          title: const Text("Contact"),
          onTap: () {
            Navigator.of(context).pushNamed("/contact");
          },
        ),
      ],
    ));
  }
}
