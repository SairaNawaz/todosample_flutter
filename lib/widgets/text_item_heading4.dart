import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextHeading4 extends StatelessWidget {
  final String title;

  TextHeading4({required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
