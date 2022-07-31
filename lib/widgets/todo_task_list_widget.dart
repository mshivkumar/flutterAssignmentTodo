import 'package:flutter/material.dart';
import 'package:flutter_assignment_todo/widgets/empty_list_widget.dart';
import 'package:flutter_assignment_todo/widgets/list_item_widget.dart';

import '../database/database.dart';
import '../models/task.dart';

class TodoTaskListWidget extends StatefulWidget {
  const TodoTaskListWidget({Key? key}) : super(key: key);

  @override
  State<TodoTaskListWidget> createState() => _TodoTaskListWidgetState();
}

class _TodoTaskListWidgetState extends State<TodoTaskListWidget> {

  @override
  void initState() {
    super.initState();
    _getTaskList();
  }

  Future<List<Task>> _getTaskList() async {
    List<Task> taskList;
    taskList = await DatabaseHelper.instance.getTaskList();
    return taskList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Task>>(
        future: _getTaskList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Container();
          }
          if(snapshot.data!.length == 0) {
            return const EmptyListWidget();
          }
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: int.parse(snapshot.data!.length.toString()),
                itemBuilder: (BuildContext context, int index) {
                  return ListItemWidget(task: snapshot.data[index]);
                });
          }
          return const EmptyListWidget();
        });
  }
}
