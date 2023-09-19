import 'package:flutter/material.dart';

class ProfileSheet extends StatelessWidget {
  const ProfileSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 52,
            child: Text("A"),
          ),
          SizedBox(
            height: 32,
          ),
          Text("Advie"),
        ],
      ),
    );
  }
}
