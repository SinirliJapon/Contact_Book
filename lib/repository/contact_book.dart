import 'package:contactbook/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class ContactBook extends ChangeNotifier {
  static Box<Contact> contactsBox = Hive.box<Contact>(contactBoxName);
  var uuid = const Uuid();

  void add({required String name, required String age, required String phoneNumber, bool isFavorite = false}) {
    var newId = uuid.v4();
    contactsBox.put(
        newId,
        Contact(
          id: newId,
          name: name,
          age: age,
          phoneNumber: phoneNumber,
          isFavorite: isFavorite,
        ));
  }

  void remove({required String id}) {
    contactsBox.delete(id);
  }

  Future<void> update(Contact updatedContact) async {
    final index = contactsBox.values.toList().indexWhere((contact) => contact.id == updatedContact.id);
    if (index == -1) {
      throw Exception('Contact not found');
    }
    await contactsBox.putAt(index, updatedContact);
  }

  void editContact({required String id, String? name, String? age, String? phoneNumber, bool? isFavorite}) {
    final contact = contactsBox.get(id);
    if (contact == null) {
      throw Exception('Contact not found');
    }

    final updatedContact = Contact(
      id: contact.id,
      name: name ?? contact.name,
      age: age ?? contact.age,
      phoneNumber: phoneNumber ?? contact.phoneNumber,
      isFavorite: isFavorite ?? contact.isFavorite,
    );

    contactsBox.put(id, updatedContact);
  }
}
