import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool? enable;
  final TextEditingController controller;
  const CustomTextField({Key? key, required this.hintText, required this.controller,this.enable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enable,
      decoration: InputDecoration(hintText: hintText,border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
