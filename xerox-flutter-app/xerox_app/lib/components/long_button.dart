import 'package:flutter/material.dart';

class LongButton extends StatelessWidget{
  const LongButton({Key? key, required this.buttonText}) : super(key: key);
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration:  BoxDecoration(
        color: Colors.blueGrey.shade900,
      ),
      child:  Text(
        buttonText,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
  
}