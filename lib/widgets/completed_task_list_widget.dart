import 'package:flutter/material.dart';
import 'package:flutter_assignment_todo/view_models/task_list_view_model.dart';
import 'package:flutter_assignment_todo/view_models/task_view_model.dart';
import 'package:flutter_assignment_todo/widgets/empty_list_widget.dart';
import 'package:flutter_assignment_todo/widgets/list_item_widget.dart';
import 'package:provider/provider.dart';

class CompletedTaskListWidget extends StatefulWidget {
  const CompletedTaskListWidget({Key? key}) : super(key: key);

  @override
  State<CompletedTaskListWidget> createState() =>
      _CompletedTaskListWidgetState();
}

class _CompletedTaskListWidgetState extends State<CompletedTaskListWidget> {
  Future<List<TaskViewModel>> _getTaskList(
      {required TaskListViewModel vm}) async {
    List<TaskViewModel> taskList;
    taskList = vm.filteredTasks;
    taskList = taskList.where((task) => task.status == 1).toList();
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
