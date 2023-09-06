import 'package:flutter/material.dart';
import 'package:project1/models/task_manager_model.dart';
import 'package:project1/screens/empty_task_screen.dart';
// import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(),
    );
  }

  // Widget buildTaskScreen() {
  //   return Consumer<TaskManager>(builder: (context, manager, child) {
  //     if (manager.taskModels.isNotEmpty) {
  //       return Container();
  //     } else {
  //       return const EmptyTaskScreen();
  //     }
  //   });
  // }
}
