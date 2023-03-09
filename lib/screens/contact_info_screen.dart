import 'package:contactbook/constants.dart';
import 'package:contactbook/model/contact.dart';
import 'package:contactbook/screens/edit_contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import '../widgets.dart';

class ContactInfoScreen extends StatefulWidget {
  static String id = 'info_screen';
  final Contact currentContact;

  const ContactInfoScreen({super.key, required this.currentContact});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditContactScreen(
                    currentContact: widget.currentContact,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              // ignore: prefer_const_constructors
              ProfilePicture(
                name: widget.currentContact.name,
                radius: 50,
                fontsize: 30,
              ),
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: Text(
                  'Contact Info',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              contactTile(
                  info: widget.currentContact.name,
                  icon: const Icon(Icons.person)),
              const SizedBox(
                height: 8.0,
              ),
              contactTile(
                  info: widget.currentContact.age,
                  icon: const Icon(Icons.numbers)),
              const SizedBox(
                height: 8.0,
              ),
              contactTile(
                  info: widget.currentContact.phoneNumber,
                  icon: const Icon(Icons.phone)),
              const SizedBox(
                height: 8.0,
              ),
              contactTile(
                info: widget.currentContact.isFavorite
                    ? 'Favorite Contact'
                    : 'Non Favorite Contact',
                icon: Icon(
                  Icons.favorite,
                  color: widget.currentContact.isFavorite
                      ? Colors.red
                      : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
