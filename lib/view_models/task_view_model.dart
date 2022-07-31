import '../models/task.dart';

class TaskViewModel {
  final Task task;

  TaskViewModel({required this.task});

  String get title {
    return task.title!;
  }

  String get description {
    return task.description!;
  }

  DateTime get date {
    return task.date!;
  }

  String get priority {
    return task.priority!;
  }

  int get status {
    return task.status!;
  }
}
