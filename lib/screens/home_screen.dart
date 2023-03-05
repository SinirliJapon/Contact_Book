import 'package:contactbook/constants.dart';
import 'package:contactbook/model/contact.dart';
import 'package:contactbook/repository/contact_book.dart';
import 'package:contactbook/screens/add_new_contact_screen.dart';
import 'package:contactbook/screens/contact_info_screen.dart';
import 'package:contactbook/widgets.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text('Contact Book'),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.of(context).pushNamed(AddNewContactScreen.id);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Contact>(contactBoxName).listenable(),
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
                                  iconSize: 40, valueChanged: (isFavorite) {}),
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
      bottomNavigationBar: Container(
        color: kPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: GNav(
            backgroundColor: kPrimaryColor,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: kPrimaryColor.shade700,
            gap: 8,
            padding: const EdgeInsets.all(16),
            tabs: [
              const GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              const GButton(
                icon: Icons.favorite_border,
                text: 'Likes',
              ),
              GButton(
                icon: Icons.compare_arrows,
                text: isDescending ? 'Descending' : 'Ascending',
                onPressed: () => setState(() => isDescending = !isDescending),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
