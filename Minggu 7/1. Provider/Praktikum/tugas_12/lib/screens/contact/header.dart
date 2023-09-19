import 'package:flutter/material.dart';

class ContactHeader extends StatelessWidget {
  const ContactHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 64),
        Icon(Icons.contacts_outlined),
        SizedBox(height: 16),
        Text(
          "Create New Contact",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22),
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                "A dialog is a type of modal windows that appears in front of app content to provide critical information, or prompt for a descision to be made",
                textAlign: TextAlign.center,
              ),
              Divider(height: 32),
            ],
          ),
        )
      ],
    );
  }
}
