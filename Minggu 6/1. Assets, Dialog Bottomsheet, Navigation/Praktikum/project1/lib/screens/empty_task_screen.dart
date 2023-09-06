import 'package:flutter/material.dart';

class EmptyTaskScreen extends StatelessWidget {
  const EmptyTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Management"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("No Task"),
      ),
    );
  }
}
