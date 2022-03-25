import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextHeading2 extends StatelessWidget {
  final String title;

  TextHeading2({required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
