import 'package:flutter/material.dart';
import 'package:my_task_app/Api/firebase_api.dart';
import 'package:my_task_app/Model/tasks.dart';

class TasksProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  // ignore: unrelated_type_equality_checks
  List<Task> get tasks => _tasks.toList();

  void setTasks(List<Task> tasks) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _tasks = tasks;
        notifyListeners();
      },
    );
  }

  void addTask(Task task) {
    FirebaseApi.createTask(task);
  }

  void removeTask(Task task) {
    FirebaseApi.deleteTask(task);
  }

  void updateTask(Task task, String title, String description) {
    task.title = title;
    task.description = description;
    FirebaseApi.updateTask(task);
  }
}
