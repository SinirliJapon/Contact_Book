import 'package:contactbook/model/contact.dart';
import 'package:contactbook/repository/contactBook.dart';
import 'package:contactbook/screens/add_new_contact_screen.dart';
import 'package:contactbook/screens/contact_info_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'home_screen';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDescending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Book'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Contact>('contacts').listenable(),
        builder: (context, value, child) {
          final contacts = value.values.toList();
          return Column(
            children: [
              TextButton.icon(
                // ignore: prefer_const_constructors
                icon: RotatedBox(
                  quarterTurns: 1,
                  child: const Icon(
                    Icons.compare_arrows,
                    size: 28,
                  ),
                ),
                label: Text(
                  isDescending ? 'Descending' : 'Ascending',
                  style: const TextStyle(fontSize: 16),
                ),
                onPressed: () => setState(() => isDescending = !isDescending),
              ),
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
                            content: Text("contact deleted"),
                          ),
                        );
                        ContactBook().remove(id: contact.id);
                      },
                      key: ValueKey(contact.id),
                      background: Container(
                        color: Colors.red,
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed(AddNewContactScreen.id);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
