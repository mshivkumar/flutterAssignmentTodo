import 'package:flutter/material.dart';
import 'package:flutter_assignment_todo/view_models/task_list_view_model.dart';
import 'package:flutter_assignment_todo/view_models/task_view_model.dart';
import 'package:flutter_assignment_todo/widgets/empty_list_widget.dart';
import 'package:flutter_assignment_todo/widgets/list_item_widget.dart';
import 'package:provider/provider.dart';

class TodoTaskListWidget extends StatefulWidget {
  const TodoTaskListWidget({Key? key}) : super(key: key);

  @override
  State<TodoTaskListWidget> createState() => _TodoTaskListWidgetState();
}

class _TodoTaskListWidgetState extends State<TodoTaskListWidget> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<TaskViewModel>> _getTaskList(
      {required TaskListViewModel vm}) async {
    List<TaskViewModel> taskList;
    taskList = vm.filteredTasks;
    taskList = taskList.where((task) => task.status == 0).toList();
    return taskList;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskListViewModel>(
      builder: (BuildContext ctx, TaskListViewModel taskVM, _) {
        return FutureBuilder<List<TaskViewModel>>(
            future: _getTaskList(vm: taskVM),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Container();
              }
              if (snapshot.data!.length == 0) {
                return const EmptyListWidget();
              }
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: int.parse(snapshot.data!.length.toString()),
                    itemBuilder: (BuildContext context, int index) {
                      return ListItemWidget(taskVM: snapshot.data[index]);
                    });
              }
              return const EmptyListWidget();
            });
      },
    );
  }
}
