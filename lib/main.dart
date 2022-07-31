import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_todo/screens/add_task_screen.dart';
import 'package:flutter_assignment_todo/screens/task_list_screen.dart';
import 'package:flutter_assignment_todo/utils/theme.dart';
import 'package:flutter_assignment_todo/view_models/task_list_view_model.dart';
import 'package:provider/provider.dart';

import 'screens/home_page.dart';
import 'screens/search_screen.dart';

void main() {
  runApp(
    DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskListViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        home: const HomePage(),
        routes: {
          AddTaskScreen.routeName: (ctx) => const AddTaskScreen(),
          TaskListScreen.routeName: (ctx) => const TaskListScreen(),
          SearchScreen.routeName: (ctx) => const SearchScreen(),
        },
      ),
    );
  }
}
