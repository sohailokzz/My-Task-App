import 'package:flutter/material.dart';
import 'package:my_task_app/Provider/task.dart';
import 'package:provider/provider.dart';
import 'Screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TasksProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Task App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Color(0xFFf6f5ee),
          ),
          home: HomeScreen(),
        ),
      );
}
