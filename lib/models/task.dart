class Task {
  int? id;
  String? title;
  String? description;
  DateTime? date;
  String? priority;
  int? status;

  Task({
    this.id,
    this.title,
    this.description,
    this.date,
    this.priority,
    this.status,
  });

  Task.withId({
    this.id,
    this.title,
    this.description,
    this.date,
    this.priority,
    this.status,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

    if (id != null) {
      map['id'] = id;
    }

    map['title'] = title;
    map['description'] = description;
    map['date'] = date!.toIso8601String();
    map['priority'] = priority;
    map['status'] = status;
    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task.withId(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: DateTime.parse(map['date']),
      priority: map['priority'],
      status: map['status'],
    );
  }

  @override
  String toString() {
    return 'Task{id: $id, title: $title, description: $description, date: $date, priority: $priority, status: $status}';
  }
}
