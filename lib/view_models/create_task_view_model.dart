import 'package:flutter/material.dart';
import 'package:flutter_assignment_todo/database/database.dart';

import '../models/task.dart';

class CreateTaskViewModel extends ChangeNotifier {
  String? title;
  String? description;
  DateTime? date;
  String? priority;
  int? status = 0;

  Future<void> createTask() async {
    final task = Task(
      title: title,
      description: description,
      date: date,
      priority: priority,
      status: status,
    );
    await DatabaseHelper.instance.insertTask(task);
    notifyListeners();
  }
}
