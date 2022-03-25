import 'package:flutter/material.dart';

class TodoAppbarTitle extends StatelessWidget {
  final String title;

  const TodoAppbarTitle(
      {Key? key, required this.title,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(title,
        style:  Theme.of(context).textTheme.headline1);
  }
}
