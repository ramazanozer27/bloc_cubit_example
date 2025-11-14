import 'package:flutter/material.dart';

class SbtTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  bool klavyeNumber;

   SbtTextField({super.key, required this.controller,required this.label,this.klavyeNumber=false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0),
      child: TextField(keyboardType: klavyeNumber ? TextInputType.number :TextInputType.multiline
        ,controller: controller,decoration: InputDecoration(border: OutlineInputBorder(),label: Text(label)),),
    );
  }
}
