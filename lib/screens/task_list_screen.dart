import 'package:flutter/material.dart';
import 'package:flutter_assignment_todo/utils/colors.dart';
import 'package:flutter_assignment_todo/utils/constants.dart';
import 'package:flutter_assignment_todo/utils/text_styles.dart';
import 'package:flutter_assignment_todo/widgets/completed_task_list_widget.dart';
import 'package:flutter_assignment_todo/widgets/todo_task_list_widget.dart';

import '../database/database.dart';
import '../models/task.dart';

class TaskListScreen extends StatefulWidget {
  static const routeName = '/task-list-screen';

  const TaskListScreen({Key? key}) : super(key: key);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  late TaskList? _loadTaskListFor;
  late List<Task>? _taskList;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _readArguments();
  }

  Future<void> _readArguments() async {
    TaskList? loadTaskListFor;
    List<Task>? taskList;
    try {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      loadTaskListFor = routeArgs['loadTaskListFor'];
    } catch (e) {
      debugPrint('Error: $e');
    }
    taskList = await DatabaseHelper.instance.getTaskList();

    setState(() {
      _loadTaskListFor = loadTaskListFor;
      _taskList = taskList;
      _isLoading = false;
    });
  }

  Widget tabHeader({required TaskList? taskListOf}) {
    switch (taskListOf) {
      case TaskList.today:
        {
          return const Text('Today\'s tasks');
        }

      case TaskList.tomorrow:
        {
          return const Text('Tomorrow\'s tasks');
        }

      default:
        {
          return const Text('Upcoming tasks');
        }
    }
  }

  Widget tabSubHeader({required bool isCompleted}) {
    return (!isCompleted)
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'To Do',
                style: AppTypography.kGilroyBold20(color: APPColors.kcWhite),
              ),
              const SizedBox(
                width: 5.0,
              ),
              const Icon(
                Icons.task_outlined,
              ),
            ],
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Done',
                style: AppTypography.kGilroyBold20(color: APPColors.kcWhite),
              ),
              const SizedBox(
                width: 5.0,
              ),
              const Icon(
                Icons.task_alt_rounded,
              ),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return (_isLoading)
        ? const CircularProgressIndicator()
        : DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                bottom: TabBar(
                  tabs: [
                    Tab(
                      child: tabSubHeader(isCompleted: false),
                    ),
                    Tab(
                      child: tabSubHeader(isCompleted: true),
                    ),
                  ],
                ),
                title: tabHeader(taskListOf: _loadTaskListFor),
              ),
              body: const TabBarView(
                children: [
                  TodoTaskListWidget(),
                  CompletedTaskListWidget(),
                ],
              ),
            ),
          );
  }
}
