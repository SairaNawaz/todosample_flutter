import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/helpers/database_helper.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/screens/add_todo_screen.dart';
import 'package:todo/widgets/appbar_title.dart';
import 'package:todo/widgets/todo_list_item.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  Future<List<Todo>>? _taskList;
  @override
  void initState() {
    super.initState();
    _updateTaskList();
  }

  //Referesh todo list
  _updateTaskList() {
    setState(() {
      _taskList = DatabaseHelper.instance.getTaskList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TodoAppbarTitle(title: 'To-Do List'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddTodoScreen(updateTaskList: _updateTaskList),
            ),
          )
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: FutureBuilder(
        future: _taskList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final int? completedTaskCount = (snapshot.data as List<Todo>)
              .where((Todo task) => task.status == 1)
              .toList()
              .length;

          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            itemCount: (snapshot.data as List<Todo>).length,
            itemBuilder: (BuildContext context, int index) {
              return TodoListItem(
                task: (snapshot.data as List<Todo>)[index],
                onCheckBoxChange: (value) {
                  (snapshot.data as List<Todo>)[index].status = value! ? 1 : 0;
                  DatabaseHelper.instance
                      .updateTask((snapshot.data as List<Todo>)[index]);
                  _updateTaskList();
                },
                onTaskTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AddTodoScreen(
                              updateTaskList: _updateTaskList,
                              task: (snapshot.data as List<Todo>)[index])));
                },
              );
            },
          );
        },
      ),
    );
  }
}
