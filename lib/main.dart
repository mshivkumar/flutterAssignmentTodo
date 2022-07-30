import 'package:flutter/material.dart';
import 'package:flutter_assignment_todo/screens/add_task_screen.dart';
import 'package:flutter_assignment_todo/screens/task_list_screen.dart';
import 'package:flutter_assignment_todo/utils/theme.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      home: const HomePage(),
      routes: {
        AddTaskScreen.routeName: (ctx) => const AddTaskScreen(),
        TaskListScreen.routeName: (ctx) => const TaskListScreen(),
      },
    );
  }
}
