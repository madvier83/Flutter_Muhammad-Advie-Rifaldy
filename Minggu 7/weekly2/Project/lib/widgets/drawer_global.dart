import 'package:flutter/material.dart';

class DrawerGlobal extends StatefulWidget {
  const DrawerGlobal({super.key});

  @override
  State<DrawerGlobal> createState() => _DrawerGlobalState();
}

class _DrawerGlobalState extends State<DrawerGlobal> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          ListTile(
            title: Text("Contact Us"),
          ),
          ListTile(
            title: Text("About Us"),
          ),
          ListTile(
            title: Text("Login"),
          ),
        ],
      ),
    );
  }
}
