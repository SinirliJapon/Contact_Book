import 'package:contactbook/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class ContactBook extends ChangeNotifier {
  static Box<Contact> contactsBox = Hive.box<Contact>(contactBoxName);
  static Box<Contact> favoriteBox = Hive.box<Contact>(favoriteBoxName);
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
    favoriteBox.put(
        newId,
        Contact(
          id: newId,
          name: name,
          age: age,
          phoneNumber: phoneNumber,
        ));
  }

  void addFavorites({
    required Contact contact,
  }) {
    var newId = uuid.v4();
    favoriteBox.put(newId, contact);
  }

  void remove({required String id}) {
    contactsBox.delete(id);
  }

  void removeFavorites({required String id}) {
    favoriteBox.delete(id);
  }
}
