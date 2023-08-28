import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final String title;
  final String subtitle;

  const ContactList({required this.title, required this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        child: Text(
          title[0],
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
