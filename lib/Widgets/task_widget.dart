import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_task_app/Model/tasks.dart';
import 'package:my_task_app/Provider/task.dart';
import 'package:my_task_app/Screens/edit_screen.dart';
import 'package:my_task_app/utilis.dart';
import 'package:provider/provider.dart';

class TasksWidget extends StatelessWidget {
  final Task task;
  DateTime dateTime = DateTime.now();

  TasksWidget({
    @required this.task,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _dateFormater = DateFormat.yMMMd().format(dateTime);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    task.description,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    _dateFormater.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {
                            editTask(context, task);
                          },
                          child: Text("Edit"),
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {
                            deleteTask(context, task);
                          },
                          child: Text("Delete"),
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(
          height: 2.0,
          color: Colors.blue,
        )
      ],
    );
  }

  void deleteTask(BuildContext context, Task task) {
    final provider = Provider.of<TasksProvider>(context, listen: false);
    provider.removeTask(task);
    Utils.showSnackBar(context, "Task Deleted");
  }

  void editTask(BuildContext context, Task task) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTaskScreen(task: task),
        ),
      );
}

//  "Lorem Ipsum has been the industry's standard dummy "
//                       "text ever since the 1500s, when an unknown printer"
//                       "took a galley of type and scrambled it to make a type specimen book"
