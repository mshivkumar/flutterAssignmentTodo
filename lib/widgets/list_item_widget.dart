import 'package:flutter/material.dart';
import 'package:flutter_assignment_todo/screens/add_task_screen.dart';
import 'package:flutter_assignment_todo/utils/colors.dart';
import 'package:flutter_assignment_todo/utils/text_styles.dart';
import 'package:flutter_assignment_todo/view_models/task_view_model.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../view_models/task_list_view_model.dart';

class ListItemWidget extends StatefulWidget {
  final TaskViewModel taskVM;
  final bool isCalledFromSearch;

  const ListItemWidget({
    required this.taskVM,
    this.isCalledFromSearch = false,
    Key? key,
  }) : super(key: key);

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  bool _isChecked = false;
  late TaskListViewModel _taskListVM;

  @override
  void initState() {
    super.initState();
    _taskListVM = Provider.of<TaskListViewModel>(context, listen: false);
    _isChecked = (widget.taskVM.status == 1) ? true : false;
  }

  Future<void> updateStatus({required bool value}) async {
    Task t = Task(
      id: widget.taskVM.task.id,
      title: widget.taskVM.task.title,
      description: widget.taskVM.task.description,
      date: widget.taskVM.task.date,
      priority: widget.taskVM.task.priority,
      status: value ? 1 : 0,
    );
    await _taskListVM.updateTask(task: t);
    await _taskListVM.getFilteredTasks(taskList: _taskListVM.loadTaskListFor);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AddTaskScreen.routeName,
            arguments: {'task': widget.taskVM});
      },
      child: Consumer<TaskListViewModel>(
        builder: (BuildContext ctx, TaskListViewModel taskListVM, _) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          APPColors.kcGraphPrimary.withOpacity(0.1),
                      radius: 30,
                      child: Icon(
                        Icons.task_outlined,
                        color: APPColors.kcGraphSecondary.withOpacity(0.5),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.taskVM.title ?? '',
                              style: AppTypography.kNunitoBold14(),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              widget.taskVM.description ?? '',
                              style: AppTypography.kNunitoSemiBold14(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !widget.isCalledFromSearch,
                      child: Checkbox(
                        checkColor: Colors.white,
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        activeColor: APPColors.kcGraphPrimary.withOpacity(0.6),
                        value: _isChecked,
                        shape: const CircleBorder(),
                        onChanged: (bool? value) async {
                          await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                //this right here
                                child: SizedBox(
                                  // color: Colors.green,
                                  height: 120,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 15.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Are you sure you want to update the status of the Task?',
                                          style: AppTypography.kNunitoBold14(),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                'cancel',
                                                style: AppTypography.kNunitoBold14( color: APPColors
                                                    .kcGraphPrimary
                                                    .withOpacity(0.7)),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () async{
                                                await updateStatus(value: value!);
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                'yes',
                                                style: AppTypography
                                                    .kNunitoBold14(
                                                    color: APPColors
                                                        .kcGraphPrimary
                                                        .withOpacity(0.7)),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
