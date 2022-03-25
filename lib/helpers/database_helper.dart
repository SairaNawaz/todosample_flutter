import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/models/todo_model.dart';

class DatabaseHelper {

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static late Database _db;

  //Set Column Names
  String tasksTable = 'task_table';
  String colId = 'id';
  String colTitle = 'title';
  String colStartDate = 'startdate';
  String colEndDate = 'enddate';
  String colStatus = 'status';

  Future<Database> get db async {
    _db = await _initDb();
    return _db;
  }
  //initialize and Create Database
  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'todo.db';
    print(path);
    final todoListDb =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return todoListDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tasksTable ($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT, $colStartDate TEXT, $colEndDate TEXT, $colStatus INTEGER)');
  }
  //Get Tasklist Map
  Future<List<Map<String, dynamic>>> getMapTaskList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(tasksTable);
    return result;
  }
  //Get Tasklist
  Future<List<Todo>> getTaskList() async {
    final List<Map<String, dynamic>> taskMapList = await getMapTaskList();
    final List<Todo> taskList = [];
    taskMapList.forEach((taskMap) {
      taskList.add(Todo.fromMap(taskMap));
    });
    taskList.sort((taskA, taskB) => taskA.startDate!.compareTo(taskB.startDate!));
    return taskList;
  }
  //Create New TODO Item
  Future<int> insertTask(Todo task) async {
    Database db = await this.db;
    final int result = await db.insert(tasksTable, task.toMap());
    return result;
  }
  //Update  TODO Item
  Future<int> updateTask(Todo task) async {
    Database db = await this.db;
    final int result = await db.update(tasksTable, task.toMap(),
        where: '$colId = ?', whereArgs: [task.id]);
    return result;
  }
  //Delete  TODO Item
  Future<int> deleteTask(int? id) async {
    Database db = await this.db;
    final int result =
        await db.delete(tasksTable, where: '$colId = ?', whereArgs: [id]);
    return result;
  }
}
