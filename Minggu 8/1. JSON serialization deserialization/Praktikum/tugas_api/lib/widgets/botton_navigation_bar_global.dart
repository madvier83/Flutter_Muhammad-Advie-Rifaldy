import 'package:flutter/material.dart';

class BottomNavigationBarGlobal extends StatefulWidget {
  const BottomNavigationBarGlobal({super.key});

  @override
  State<BottomNavigationBarGlobal> createState() =>
      _BottomNavigationBarGlobalState();
}

class _BottomNavigationBarGlobalState extends State<BottomNavigationBarGlobal> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (value) {
          if (value == 0) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/home",
              (route) => false,
            );
          }
          if (value == 1) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/image-generator",
              (route) => false,
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: "Image Generator",
          ),
        ]);
  }
}
