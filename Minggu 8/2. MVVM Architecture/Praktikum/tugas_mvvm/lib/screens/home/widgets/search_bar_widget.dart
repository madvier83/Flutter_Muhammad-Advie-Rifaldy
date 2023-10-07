import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_api/screens/home/home_screen_model.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: (val) =>
                val != "" ? value.getContactById(val) : value.getContacts(),
            decoration: const InputDecoration(
              hintText: "Search by id ...",
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        );
      },
    );
  }
}
