import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function onTap;

  const TodoTextFormField(
      {Key? key, required this.controller, required this.onTap, required this.label, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        readOnly: true,
        controller: controller,
        style: TextStyle(fontSize: 18),
        onTap: () => onTap(),
        validator: (input) => input!.trim().isEmpty
        ? 'Please Enter a valid data'
        : null,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 18,
              fontFamily: 'ProximaNova',
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }
}
