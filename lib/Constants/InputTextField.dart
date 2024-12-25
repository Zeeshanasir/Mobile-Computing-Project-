import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final Icon iconTextField;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.obscureText,
      required this.iconTextField});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          prefixIcon: iconTextField,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(40),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          fillColor: Colors.grey.shade100,
          filled: true),
    );
  }
}