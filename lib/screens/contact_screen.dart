import 'package:contactbook/model/contact.dart';
import 'package:contactbook/screens/add_contact_screen.dart';
import 'package:contactbook/utils/widgets/contact_item.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);
  static String id = 'contact_screen';

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  bool isDescending = false;
  bool isFavoriteChecked = false;

  List<Contact> sortAndFilterContacts(List<Contact> contacts, bool isDescending, bool isFavoriteChecked) {
    final List<Contact> sortedContacts = List.from(contacts)
      ..sort((contact1, contact2) => isDescending ? contact2.name.compareTo(contact1.name) : contact1.name.compareTo(contact2.name));
    final List<Contact> filteredContacts = isFavoriteChecked ? sortedContacts.where((contact) => contact.isFavorite).toList() : sortedContacts;

    return filteredContacts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Book"),
        actions: [
          IconButton(
            onPressed: () async => await Navigator.push(context, MaterialPageRoute(builder: (context) => const AddContactScreen())),
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () => setState(() => isDescending = !isDescending),
            icon: Icon(isDescending ? Icons.arrow_downward : Icons.arrow_upward),
          ),
          IconButton(
            onPressed: () => setState(() => isFavoriteChecked = !isFavoriteChecked),
            icon: Icon(Icons.favorite, color: isFavoriteChecked ? Colors.red : Colors.white),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Contact>(contactBoxName).listenable(),
        builder: (context, value, child) {
          final contacts = value.values.toList();
          if (value.isEmpty) {
            return const Center(child: Text('There are no contacts'));
          } else {
            final List<Contact> contactList = sortAndFilterContacts(contacts, isDescending, isFavoriteChecked);
            if (contactList.isEmpty) {
              return const Center(child: Text('There are no favorite contacts'));
            } else {
              return ListView.builder(
                itemCount: contactList.length,
                itemBuilder: (context, index) {
                  final contact = contactList[index];
                  return ContactItem(contact: contact);
                },
              );
            }
          }
        },
      ),
    );
  }
}
