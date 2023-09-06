import 'package:flutter/material.dart';
import 'package:project1/models/task_model.dart';

class TaskItemScreen extends StatefulWidget {
  // const TaskItemScreen({super.key});
  final Function(TaskModel) onCreate;
  const TaskItemScreen({
    super.key,
    required this.onCreate,
  });

  @override
  State<TaskItemScreen> createState() => _TaskItemScreenState();
}

class _TaskItemScreenState extends State<TaskItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: ListView(
          children: [
            // buildTaskItem
          ],
        ),
      ),
    );
  }
}
