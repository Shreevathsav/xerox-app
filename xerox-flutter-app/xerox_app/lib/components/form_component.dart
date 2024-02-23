// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      this.width = double.infinity})
      : super(key: key);

  final controller;
  final String hintText;
  final bool obscureText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintText,
            //contentPadding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 5.0),
            hintStyle: TextStyle(
              color: Colors.grey[500],
            ),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
  }
}
