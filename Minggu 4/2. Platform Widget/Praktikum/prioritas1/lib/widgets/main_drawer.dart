import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          ListTile(
            title: Text("Home"),
          ),
          ListTile(
            title: Text("Settings"),
          ),
        ],
      ),
    );
  }
}
