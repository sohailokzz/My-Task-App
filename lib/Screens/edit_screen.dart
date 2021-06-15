import 'package:flutter/material.dart';
import 'package:my_task_app/Model/tasks.dart';
import 'package:my_task_app/Provider/task.dart';
import 'package:my_task_app/Widgets/task_form.dart';
import 'package:provider/provider.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;

  const EditTaskScreen({Key key, this.task}) : super(key: key);

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String title;
  String description;

  @override
  void initState() {
    super.initState();

    title = widget.task.title;
    description = widget.task.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Edit Task'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 25.0, 12.0, 20.0),
        child: Form(
          key: _formKey,
          child: TaskForm(
            title: title,
            description: description,
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
            saveTask: saveTask,
          ),
        ),
      ),
    );
  }

  void saveTask() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TasksProvider>(context, listen: false);

      provider.updateTask(widget.task, title, description);

      Navigator.of(context).pop();
    }
  }
}
