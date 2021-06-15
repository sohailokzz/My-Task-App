import 'package:flutter/material.dart';
import 'package:my_task_app/Model/tasks.dart';
import 'package:my_task_app/Provider/task.dart';
import 'package:my_task_app/Widgets/task_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TasksProvider>(context);
    final tasks = provider.tasks;

    return tasks.isEmpty
        ? Center(
            child: Text(
              'No Tasks Available',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          )
        : ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              final task = tasks[index];

              return TasksWidget(task: task);
            });
  }
}

// ListView.separated(
//             physics: BouncingScrollPhysics(),
//             padding: EdgeInsets.all(16),
//             separatorBuilder: (context, index) => Container(height: 8),
//             itemCount: tasks.length,
//             itemBuilder: (context, index) {
//               final task = tasks[index];

//               return TasksWidget(task: task);
//             },
//           );
