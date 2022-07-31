import 'package:flutter/material.dart';
import 'package:flutter_assignment_todo/database/database.dart';

import '../models/task.dart';
import '../utils/constants.dart';
import 'task_view_model.dart';

enum Status { loading, empty, success }

class TaskListViewModel extends ChangeNotifier {
  List<TaskViewModel> allTasks = <TaskViewModel>[];
  List<TaskViewModel> filteredTasks = <TaskViewModel>[];
  TaskList _loadTaskListFor = TaskList.today;
  TaskList get loadTaskListFor => _loadTaskListFor;
  Status status = Status.empty;

  Future<void> getAllTasks() async {
    status = Status.loading;
    final results = await DatabaseHelper.instance.getAllTaskList();
    allTasks = results.map((task) => TaskViewModel(task: task)).toList();
    status = allTasks.isEmpty ? Status.empty : Status.success;
    notifyListeners();
  }

  Future<void> getFilteredTasks({required TaskList taskList}) async {
    status = Status.loading;
    final results = await DatabaseHelper.instance.getFilteredTaskList(loadList: taskList);
    filteredTasks = results.map((task) => TaskViewModel(task: task)).toList();
    status = filteredTasks.isEmpty ? Status.empty : Status.success;
    notifyListeners();
  }

  Future<void> createTask({required Task task}) async {
    await DatabaseHelper.instance.insertTask(task);
    notifyListeners();
  }

  Future<void> updateTask({required Task task}) async {
    await DatabaseHelper.instance.updateTask(task);
    notifyListeners();
  }

  Future<void> deleteTask({required int id}) async {
    DatabaseHelper.instance.deleteTask(id);
    notifyListeners();
  }

  Future<void> setTaskListFor({required TaskList taskListFor}) async {
    _loadTaskListFor = taskListFor;
  }
}
