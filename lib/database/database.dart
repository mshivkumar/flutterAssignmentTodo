import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/task.dart';
import '../utils/constants.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();

  static Database? _db;

  DatabaseHelper._instance();

  String taskTable = 'task_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colDate = 'date';
  String colPriority = 'priority';
  String colStatus = 'status';

  Future<Database?> get db async {
    _db ??= await _initDb();
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}task_list.db';
    final taskListDB =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return taskListDB;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $taskTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDescription TEXT, $colDate TEXT, $colPriority TEXT, $colStatus INTEGER)');
  }

  Future<List<Map<String, dynamic>>> getTaskMapList() async {
    Database? db = await this.db;
    final List<Map<String, dynamic>> result = await db!.query(taskTable);
    return result;
  }

  Future<List<Task>> getAllTaskList() async {
    final List<Map<String, dynamic>> taskMapList = await getTaskMapList();

    final List<Task> taskList = [];

    for (var taskMap in taskMapList) {
      taskList.add(Task.fromMap(taskMap));
    }
    taskList.sort((noteA, noteB) => noteA.date!.compareTo(noteB.date!));

    return taskList;
  }

  Future<List<Task>> getFilteredTaskList({required TaskList loadList}) async {
    DateTime today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final List<Map<String, dynamic>> taskMapList = await getTaskMapList();

    List<Task> _taskList = [];

    for (var taskMap in taskMapList) {
      _taskList.add(Task.fromMap(taskMap));
    }
    _taskList.sort((noteA, noteB) => noteB.date!.compareTo(noteA.date!));
    if (loadList.toString() == TaskList.today.toString()) {
      List<Task> taskList = _taskList;
      _taskList =
          taskList.where((task) => task.date!.isAtSameMomentAs(today)).toList();
    } else if (loadList.toString() == TaskList.tomorrow.toString()) {
      List<Task> taskList = _taskList;
      _taskList = taskList
          .where((task) => (task.date!.isAfter(today) &&
              task.date!.isBefore(today.add(const Duration(days: 2)))))
          .toList();
    } else {
      List<Task> taskList = _taskList;
      _taskList = taskList
          .where(
              (task) => task.date!.isAfter(today.add(const Duration(days: 2))))
          .toList();
    }
    return _taskList;
  }

  Future<int> insertTask(Task task) async {
    Database? db = await this.db;
    final int result = await db!.insert(
      taskTable,
      task.toMap(),
    );
    return result;
  }

  Future<int> updateTask(Task task) async {
    Database? db = await this.db;
    final int result = await db!.update(
      taskTable,
      task.toMap(),
      where: '$colId = ?',
      whereArgs: [task.id],
    );
    return result;
  }

  Future<int> deleteTask(int id) async {
    Database? db = await this.db;
    final int result = await db!.delete(
      taskTable,
      where: '$colId = ?',
      whereArgs: [id],
    );
    return result;
  }
}
