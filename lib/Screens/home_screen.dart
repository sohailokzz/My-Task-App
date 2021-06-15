import 'package:flutter/material.dart';
import 'package:my_task_app/Api/firebase_api.dart';
import 'package:my_task_app/Model/tasks.dart';
import 'package:my_task_app/Provider/task.dart';
import 'package:my_task_app/main.dart';
import 'package:my_task_app/Widgets/task_list.dart';
import 'package:my_task_app/Widgets/add_task.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('My Tasks Today'),
        ),
      ),
      body: StreamBuilder<List<Task>>(
        stream: FirebaseApi.readTask(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return Text('Something Went Wrong');
              } else {
                final tasks = snapshot.data;
                final provider = Provider.of<TasksProvider>(context);
                provider.setTasks(tasks);

                return TasksList();
              }
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            isScrollControlled: true,
            context: context,
            builder: (context) => AddTask(),
          );
        },
        label: Text('Add More Tasks'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
