import 'package:flutter/material.dart';
import 'package:flutter_assignment_todo/utils/colors.dart';
import 'package:flutter_assignment_todo/utils/constants.dart';

class TaskListScreen extends StatefulWidget {
  static const routeName = '/task-list-screen';
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  late TaskList list;

  @override
  void initState() {
    super.initState();
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    list = routeArgs['taskList'];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text('Tabs Demo'),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      );
  }
}
