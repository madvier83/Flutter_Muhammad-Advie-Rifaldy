import 'package:flutter/material.dart';
import 'package:project1/components/profile_sheet.dart';
import 'package:project1/models/task_manager_model.dart';
import 'package:project1/screens/task_item_screen.dart';
import 'package:project1/screens/task_list_screen.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  final TaskManager manager;
  const TaskScreen({
    super.key,
    required this.manager,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Management"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const SizedBox(
                    width: double.infinity,
                    child: ProfileSheet(),
                  );
                },
              );
            },
            icon: const Icon(Icons.account_circle),
          )
        ],
      ),
      body: TaskListScreen(manager: manager),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final manager = Provider.of<TaskManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TaskItemScreen(
                  onCreate: (task) {
                    manager.addTask(task);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
