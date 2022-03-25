import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/widgets/text_item_heading2.dart';
import 'package:todo/widgets/text_item_heading3.dart';
import 'package:todo/widgets/text_item_heading4.dart';
import 'package:todo/widgets/text_item_heading5.dart';

class TodoListItem extends StatelessWidget {
  final Todo task;
  final Function onCheckBoxChange;
  final Function onTaskTap;
  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');

  TodoListItem(
      {required this.task,
      required this.onCheckBoxChange,
      required this.onTaskTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  offset: Offset(1.5, 1.5),
                  blurRadius: 10,
                ),
              ]),
          child: InkWell(
            onTap: () => onTaskTap(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextHeading2(title: task.title!),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        children: [
                          TextHeading3(title: 'Start Date'),
                          TextHeading4(
                              title:
                                  '${_dateFormatter.format(task.startDate!)}'),
                        ],
                      ),
                      Wrap(
                        direction: Axis.vertical,
                        children: [
                          TextHeading3(title: 'End Date'),
                          TextHeading4(
                              title: '${_dateFormatter.format(task.endDate!)}'),
                        ],
                      ),
                      Wrap(
                        direction: Axis.vertical,
                        children: [
                          TextHeading3(title: 'Time Left'),
                          TextHeading4(
                              title:
                                  '${task.endDate!.difference(task.startDate!).inHours} hours'),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey.shade200,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 10,
                        children: [
                          TextHeading3(title: 'Status'),
                          TextHeading4(
                              title:
                                  "${task.status == 0 ? "Incomplete" : "Completed"}"),
                        ],
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.horizontal,
                        spacing: 10,
                        children: [
                          TextHeading5(title: 'Tick if Completed'),
                          Checkbox(
                            onChanged: (value) => onCheckBoxChange(value),
                            activeColor: Theme.of(context).primaryColor,
                            value: task.status == 1 ? true : false,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
