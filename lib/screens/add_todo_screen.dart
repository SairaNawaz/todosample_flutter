import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/helpers/database_helper.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/widgets/appbar_title.dart';
import 'package:todo/widgets/todo_button.dart';
import 'package:todo/widgets/todo_text_form_field.dart';
import 'package:todo/widgets/todo_text_form_field_2.dart';

class AddTodoScreen extends StatefulWidget {
  final Function? updateTaskList;
  final Todo? task;

  AddTodoScreen({this.updateTaskList, this.task});

  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _title = "";
  DateTime? _startdate = DateTime.now();
  DateTime? _enddate = DateTime.now();
  TextEditingController _startdateController = TextEditingController();
  TextEditingController _enddateController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');

  //Set future only date for To-Do start date
  _handleStartDatePicker() async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: _startdate!,
        firstDate: _startdate!,
        lastDate: DateTime(2050));
    if (date != null && date != _startdate) {
      setState(() {
        _startdate = date;
      });
      _startdateController.text = _dateFormatter.format(date);
    }
  }
  //Set date greater than start date for To-Do end date
  _handleEndDatePicker() async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: _startdate!,
        firstDate: _startdate!,
        lastDate: DateTime(2050));
    if (date != null && date != _enddate) {
      setState(() {
        _enddate = date;
      });
      _enddateController.text = _dateFormatter.format(date);
    }
  }

  _submit() {
    //Perform form validation before submitting
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('$_title, $_startdate ,$_enddate');

      // Insert Task to Users Database
      Todo task = Todo(title: _title, startDate: _startdate, endDate: _enddate);
      if (widget.task == null) {
        task.status = 0;
        DatabaseHelper.instance.insertTask(task);
      } else {
        // Update Task to Users Database
        task.id = widget.task!.id;
        task.status = widget.task!.status;
        DatabaseHelper.instance.updateTask(task);
      }

      widget.updateTaskList!();
      Navigator.pop(context);
    }
  }

  _delete() {
    DatabaseHelper.instance.deleteTask(widget.task!.id);
    widget.updateTaskList!();
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _title = widget.task!.title;
      _enddate = widget.task!.endDate;
      _startdate = widget.task!.startDate;
    }

    _startdateController.text = _dateFormatter.format(_startdate!);
    _enddateController.text = _dateFormatter.format(_enddate!);
    _titleController.text = _title!;
  }

  @override
  void dispose() {
    _startdateController.dispose();
    _enddateController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TodoAppbarTitle(
            title: widget.task == null ? 'Add To-Do' : 'Update To-Do'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TodoTextFormField2(
                        label: 'To-Do Title',
                        controller: _titleController,
                        onSave: (input) => _title = input,
                      ),
                      TodoTextFormField(
                        label: 'Start Date',
                        controller: _startdateController,
                        onTap: () => _handleStartDatePicker(),
                      ),
                      TodoTextFormField(
                        label: 'End Date',
                        controller: _enddateController,
                        onTap: () => _handleEndDatePicker(),
                      ),
                      TodoButton(
                        title: widget.task == null ? 'Add' : 'Update',
                        onTap: () => _submit(),
                      ),
                      widget.task != null
                          ? TodoButton(
                              title: 'Delete',
                              onTap: () => _delete(),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
