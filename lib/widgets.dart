import 'package:flutter/material.dart';

ButtonStyle kTextButtonStyle() {
  return ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsets>(
      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    ),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          side: BorderSide(color: Colors.teal)),
    ),
  );
}

BoxDecoration kBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      width: 1,
      color: Colors.teal,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(32.0),
    ),
  );
}
