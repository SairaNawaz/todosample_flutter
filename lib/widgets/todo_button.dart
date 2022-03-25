import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const TodoButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 60.0,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30.0)),
      child: TextButton(
        onPressed: () => onTap(),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'ProximaNova',
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
