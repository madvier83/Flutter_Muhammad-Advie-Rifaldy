import 'package:flutter/material.dart';
import 'package:project1/models/task_model.dart';

class TaskManager extends ChangeNotifier {
  final _taskModels = <TaskModel>[];

  List<TaskModel> get taskModels {
    return List.unmodifiable(_taskModels);
  }

  void deleteTask(int index) {
    _taskModels.removeAt(index);
    notifyListeners();
  }

  void addTask(TaskModel task) {
    _taskModels.add(task);
    notifyListeners();
  }
}
