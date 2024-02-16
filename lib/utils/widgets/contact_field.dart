import 'package:contactbook/utils/constants.dart';
import 'package:flutter/material.dart';

class ContactField extends StatelessWidget {
  final TextEditingController controller;
  final InputDecoration decoration;
  final String labelText;
  final String hintText;
  final Widget prefixIcon;

  const ContactField({
    super.key,
    required this.controller,
    required this.decoration,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      controller: controller,
      style: const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
      decoration: kTextFieldDecoration.copyWith(
        labelText: labelText,
        labelStyle: const TextStyle(color: kPrimaryColor),
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixIconColor: kPrimaryColor,
      ),
    );
  }
}
