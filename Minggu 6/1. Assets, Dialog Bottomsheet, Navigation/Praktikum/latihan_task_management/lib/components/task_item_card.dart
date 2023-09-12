import 'package:flutter/material.dart';
import 'package:project1/models/task_model.dart';

class TaskItemCard extends StatelessWidget {
  final TaskModel task;
  final Function() onPressed;
  const TaskItemCard({
    super.key,
    required this.task,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(task.taskName),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text('Are your sure?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('No'),
                      ),
                      TextButton(
                        onPressed: onPressed,
                        child: Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.delete_forever_rounded),
          )
        ],
      ),
    );
  }
}
