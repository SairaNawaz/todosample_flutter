import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextHeading3 extends StatelessWidget {
  final String title;

  TextHeading3({required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
