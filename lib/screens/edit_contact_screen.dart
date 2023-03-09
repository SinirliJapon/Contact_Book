import 'package:contactbook/constants.dart';
import 'package:contactbook/model/contact.dart';
import 'package:contactbook/repository/contact_book.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../widgets.dart';

class EditContactScreen extends StatefulWidget {
  static String id = 'edit_contact_screen';
  final Contact currentContact;

  const EditContactScreen({super.key, required this.currentContact});

  @override
  State<EditContactScreen> createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {
  late final TextEditingController nameController;
  late final TextEditingController ageController;
  late final TextEditingController phoneNumberController;
  final ContactBook contactBook = ContactBook();
  final String name = " ";

  @override
  void initState() {
    nameController = TextEditingController();
    ageController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 50,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundColor: kPrimaryColor,
                child: Icon(
                  Icons.person_2_outlined,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: Text(
                  'Update Contact',
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
              contactField(
                controller: nameController,
                decoration: kTextFieldDecoration,
                hintText: "Update contact's name ...",
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(
                height: 8.0,
              ),
              contactField(
                controller: ageController,
                decoration: kTextFieldDecoration,
                hintText: "Update contact's age ...",
                prefixIcon: const Icon(Icons.numbers),
              ),
              const SizedBox(
                height: 8.0,
              ),
              contactField(
                controller: phoneNumberController,
                decoration: kTextFieldDecoration,
                hintText: "Updata contact's phone number ...",
                prefixIcon: const Icon(Icons.phone),
              ),
              const SizedBox(
                height: 24,
              ),
              TextButton(
                style: kTextButtonStyle(),
                onPressed: () {
                  ContactBook().editContact(
                    id: widget.currentContact.id,
                    name: nameController.text,
                    age: ageController.text,
                    phoneNumber: phoneNumberController.text,
                    isFavorite: false,
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  'Update Contact',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
