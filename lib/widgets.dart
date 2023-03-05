import 'package:contactbook/constants.dart';
import 'package:flutter/material.dart';

ButtonStyle kTextButtonStyle() {
  return ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsets>(
      const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
    ),
    backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          side: BorderSide(color: kPrimaryColor)),
    ),
  );
}

BoxDecoration kBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      width: 1,
      color: kPrimaryColor,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(10.0),
    ),
  );
}

Widget buildButton({
  required String title,
  required IconData icon,
  required VoidCallback onClicked,
}) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
        backgroundColor: Colors.teal,
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: onClicked,
      child: Row(
        children: [
          Icon(
            icon,
            size: 28,
            color: Colors.white,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

TextField contactField({
  required TextEditingController controller,
  required InputDecoration decoration,
  required String hintText,
  required Widget prefixIcon,
}) =>
    TextField(
      cursorColor: kPrimaryColor,
      style: const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
      decoration: kTextFieldDecoration.copyWith(
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixIconColor: kPrimaryColor,
      ),
      controller: controller,
    );

FloatingActionButton contactButton({
  required String info,
  required Icon icon,
}) =>
    FloatingActionButton.extended(
      heroTag: null,
      onPressed: () {},
      icon: icon,
      label: Text(
        info,
        textAlign: TextAlign.start,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: kPrimaryColor,
    );

Container kDismissibleContainer = Container(
  color: Colors.red,
  child: const Align(
    alignment: Alignment.centerRight,
    child: Icon(
      Icons.delete,
      color: Colors.white,
    ),
  ),
);
