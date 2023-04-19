import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType keyboardType;
  final bool isPassword;

  const RoundedTextField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.controller,
      required this.icon,
      this.keyboardType = TextInputType.text,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        autofocus: true,
        keyboardType: keyboardType,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
