import 'package:flutter/material.dart';
import 'package:prioritas1/models/contact_model.dart';

class ContactList extends StatelessWidget {
  final Contact contact;

  const ContactList({required this.contact, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.orange,
        child: Text(
          contact.name[0],
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.phone),
    );
  }
}
