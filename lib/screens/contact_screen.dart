import 'package:contactbook/model/contact.dart';
import 'package:contactbook/repository/contact_book.dart';
import 'package:contactbook/screens/contact_info_screen.dart';
import 'package:contactbook/widgets.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
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
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text("Contact Book"),
        actions: [
          IconButton(
            onPressed: () => setState(() => isDescending = !isDescending),
            icon:
                Icon(isDescending ? Icons.arrow_downward : Icons.arrow_upward),
          ),
          IconButton(
            onPressed: () =>
                setState(() => isFavoriteChecked = !isFavoriteChecked),
            icon: Icon(
              Icons.favorite,
              color: isFavoriteChecked ? Colors.red : Colors.white,
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Contact>(contactBoxName).listenable(),
        builder: (context, value, child) {
          final contacts = value.values.toList();
          final sortedContacts = contacts
            ..sort((contact1, contact2) => isDescending
                ? contact2.name.compareTo(contact1.name)
                : contact1.name.compareTo(contact2.name));
          final filteredContacts = isFavoriteChecked
              ? sortedContacts.where((contact) => contact.isFavorite).toList()
              : sortedContacts;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: filteredContacts.length,
                  itemBuilder: (context, index) {
                    final contact = filteredContacts[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Dismissible(
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Contact Deleted..."),
                            ),
                          );
                          ContactBook().remove(id: contact.id);
                        },
                        key: ValueKey(contact.id),
                        background: kDismissibleContainer,
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.white,
                          elevation: 6.0,
                          child: TextButton(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ContactInfoScreen(
                                    currentContact: contact,
                                  ),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: ProfilePicture(
                                name: contact.name,
                                radius: 25,
                                fontsize: 15,
                              ),
                              title: Text(contact.name),
                              trailing: FavoriteButton(
                                iconSize: 40,
                                isFavorite: contact.isFavorite,
                                valueChanged: (isFavorite) {
                                  setState(() {
                                    contact.isFavorite = isFavorite;
                                  });
                                  ContactBook().update(contact);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
