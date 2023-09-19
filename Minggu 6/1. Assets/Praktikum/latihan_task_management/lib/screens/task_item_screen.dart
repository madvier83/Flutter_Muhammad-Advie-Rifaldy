import 'package:flutter/material.dart';
import 'package:project1/models/task_model.dart';
import 'package:uuid/uuid.dart';

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
  final _taskNameControler = TextEditingController();
  String _taskName = '';

  @override
  void initState() {
    super.initState();
    _taskNameControler.addListener(() {
      _taskName = _taskNameControler.text;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _taskNameControler.dispose();
  }

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
            buildNameField(),
            const SizedBox(height: 8),
            buildButton(),
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Task Title'),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: _taskNameControler,
          decoration: const InputDecoration(
            hintText: 'E.g study',
            filled: true,
          ),
        ),
      ],
    );
  }

  Widget buildButton() {
    return FilledButton(
      onPressed: () {
        final taskItem = TaskModel(
          id: const Uuid().v1(),
          taskName: _taskNameControler.text,
        );
        widget.onCreate(taskItem);
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
      ),
      child: const Text('Create Task'),
    );
  }
}
