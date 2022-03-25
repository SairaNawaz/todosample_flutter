import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoTextFormField2 extends StatelessWidget {
  final String label;
  final TextEditingController controller;
 final Function onSave;

  const TodoTextFormField2(
     {
    Key? key,
    required this.controller,
    required this.label,
    required  this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        style: TextStyle(fontSize: 18),
        controller:controller,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 18,
              fontFamily: 'ProximaNova',
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
            hintText: label,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0))),
        onSaved: (input) => onSave(input),
      //  initialValue: _title,
      ),
    );
  }
}
