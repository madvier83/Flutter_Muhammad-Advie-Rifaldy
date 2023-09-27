import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerGlobal extends StatefulWidget {
  const DrawerGlobal({super.key});

  @override
  State<DrawerGlobal> createState() => _DrawerGlobalState();
}

class _DrawerGlobalState extends State<DrawerGlobal> {
  late SharedPreferences loginData;

  String? username;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString("username").toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(height: 32),
          ListTile(
            title: Text("$username"),
            leading: CircleAvatar(
              backgroundColor: Colors.purple,
              child: Text(username?[0] ?? ""),
            ),
            onTap: () {
              Navigator.of(context).pushNamed("/home");
            },
          ),
          const Divider(),
          const ListTile(
            title: Text(
              "Shared Preferences & SQLite",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          ListTile(
            title: const Text("Home"),
            onTap: () {
              Navigator.of(context).pushNamed("/home");
            },
          ),
          ListTile(
            title: const Text("Contact SQLite"),
            onTap: () {
              Navigator.of(context).pushNamed("/contact");
            },
          ),
          ListTile(
            title: FilledButton(
              onPressed: () {
                loginData.setBool("login", true);
                loginData.remove("username");
                Navigator.of(context).pushNamedAndRemoveUntil(
                  "/login",
                  (route) => false,
                );
              },
              child: const Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }
}
