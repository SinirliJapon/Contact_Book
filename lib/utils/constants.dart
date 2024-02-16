import 'package:flutter/material.dart';

const kPrimaryColor = Colors.teal;
const kBorderColor = Colors.grey;
const kForegroundColor = Colors.white;
const kSlidableBackgrondColor = Colors.red;

const kTextFieldDecoration = InputDecoration(
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

const kTextButtonStyle = ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(kPrimaryColor),
  foregroundColor: MaterialStatePropertyAll(kForegroundColor),
  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)),
  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), side: BorderSide(color: kPrimaryColor)),
  ),
);
