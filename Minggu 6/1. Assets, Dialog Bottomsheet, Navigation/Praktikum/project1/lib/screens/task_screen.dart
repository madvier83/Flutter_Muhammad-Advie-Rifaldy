import 'package:flutter/material.dart';
import 'package:project1/screens/task_item_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Management"),
        centerTitle: true,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) {
      //           return TaskItemScreen(
      //             onCreate: (task) {
      //               manager.addTask();
      //               Navigator.pop(context);
      //             },
      //           );
      //         },
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
