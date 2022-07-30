class Task {
  int? id;
  String? title;
  DateTime? date;
  String? priority;
  int? status;

  Task({
    this.id,
    this.title,
    this.date,
    this.priority,
    this.status,
  });

  @override
  String toString() {
    return 'Task{id: $id, title: $title, date: $date, priority: $priority, status: $status}';
  }
}
