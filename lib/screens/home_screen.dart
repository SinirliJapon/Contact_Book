import 'package:contactbook/constants.dart';
import 'package:contactbook/model/contact.dart';
import 'package:contactbook/repository/contact_book.dart';
import 'package:contactbook/screens/add_new_contact_screen.dart';
import 'package:contactbook/screens/contact_info_screen.dart';
import 'package:contactbook/widgets.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDescending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Contact Book'),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Contact>('contacts').listenable(),
        builder: (context, value, child) {
          final contacts = value.values.toList();
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final sortedContacts = contacts
                      ..sort((contact1, contact2) => isDescending
                          ? contact2.name.compareTo(contact1.name)
                          : contact1.name.compareTo(contact2.name));
                    final contact = sortedContacts[index];
                    return Dismissible(
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
                              radius: 20,
                              fontsize: 10,
                            ),
                            title: Text(contact.name),
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
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () => setState(() => isDescending = !isDescending),
            icon: const RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.compare_arrows,
                size: 28,
              ),
            ),
          ),
          label: isDescending ? 'Descending' : 'Ascending',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () async {
              await Navigator.of(context).pushNamed(AddNewContactScreen.id);
            },
            icon: const Icon(Icons.add),
          ),
          label: 'Add',
        ),
      ]),
    );
  }
}
