import 'package:flutter/material.dart';
import 'package:flutter_assignment_todo/database/database.dart';

import '../models/task.dart';

class UpdateTaskViewModel extends ChangeNotifier {
  int? id;
  String? title;
  String? description;
  DateTime? date;
  String? priority;
  int? status;

  Future<void> updateTask() async {
    final task = Task(
      id: id,
      title: title,
      description: description,
      date: date,
      priority: priority,
      status: status,
    );
    await DatabaseHelper.instance.updateTask(task);
    notifyListeners();
  }
}
