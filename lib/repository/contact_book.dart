import 'package:contactbook/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class ContactBook extends ChangeNotifier {
  static Box<Contact> contactsBox = Hive.box<Contact>(contactBoxName);
  var uuid = const Uuid();

  void add({
    required String name,
    required String age,
    required String phoneNumber,
  }) {
    var newId = uuid.v4();
    contactsBox.put(
        newId,
        Contact(
          id: newId,
          name: name,
          age: age,
          phoneNumber: phoneNumber,
        ));
  }

  void remove({required String id}) {
    contactsBox.delete(id);
  }
}
