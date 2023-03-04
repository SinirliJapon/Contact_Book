import 'package:flutter/material.dart';

const kBackgroundColor = Colors.black;
const kPrimaryColor = Colors.teal;
const kBorderColor = Colors.grey;

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a new contact name here...',
  hintStyle: TextStyle(color: Colors.black54),
  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kBorderColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
