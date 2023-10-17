import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() deleteContact;

  const ContactList(
      {required this.title,
      required this.subtitle,
      required this.deleteContact,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      leading: CircleAvatar(
        child: Text(
          title[0],
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () => {},
            icon: const Icon(Icons.mode_edit_outline_outlined),
          ),
          IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () => {},
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
