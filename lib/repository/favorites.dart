import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import '../model/contact.dart';

class Favorites extends ChangeNotifier {
  static Box<Contact> favoriteBox = Hive.box<Contact>(favoriteBoxName);
  var uuid = const Uuid();

  void add({
    required String name,
    required String age,
    required String phoneNumber,
  }) {
    var newId = uuid.v4();
    favoriteBox.put(
        newId,
        Contact(
          id: newId,
          name: name,
          age: age,
          phoneNumber: phoneNumber,
        ));
  }

  void remove({required String id}) {
    favoriteBox.delete(id);
  }
}
