import 'package:flutter/material.dart';
import 'package:my_task_app/Model/tasks.dart';
import 'package:my_task_app/Provider/task.dart';
import 'package:my_task_app/Widgets/task_form.dart';
import 'package:provider/provider.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Add Task',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            TaskForm(
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              saveTask: saveTask,
            ),
          ],
        ),
      ),
    );
  }

  void saveTask() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final task = Task(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<TasksProvider>(context, listen: false);
      provider.addTask(task);

      Navigator.of(context).pop();
    }
  }
}
