import 'package:contactbook/constants.dart';
import 'package:contactbook/repository/contact_book.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../widgets.dart';

class AddNewContactScreen extends StatefulWidget {
  const AddNewContactScreen({super.key});
  static String id = 'add_contact_screen';

  @override
  State<AddNewContactScreen> createState() => _AddNewContactScreenState();
}

class _AddNewContactScreenState extends State<AddNewContactScreen> {
  late final TextEditingController nameController;
  late final TextEditingController ageController;
  late final TextEditingController phoneNumberController;
  final ContactBook contactBook = ContactBook();

  @override
  void initState() {
    nameController = TextEditingController();
    ageController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  Future<List<Contact>> getContacts() async {
    bool isGranted = await Permission.contacts.status.isGranted;
    if (!isGranted) {
      await Permission.contacts.request().isGranted;
    }
    if (isGranted) {
      return await FastContacts.allContacts;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Add a new Contact',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            contactField(
              controller: nameController,
              decoration: kTextFieldDecoration,
              hintText: "Enter contact's name ...",
            ),
            const SizedBox(
              height: 8.0,
            ),
            contactField(
              controller: ageController,
              decoration: kTextFieldDecoration,
              hintText: "Enter contact's age ...",
            ),
            const SizedBox(
              height: 8.0,
            ),
            contactField(
              controller: phoneNumberController,
              decoration: kTextFieldDecoration,
              hintText: "Enter contact's phone number ...",
            ),
            const SizedBox(
              height: 24,
            ),
            TextButton(
              style: kTextButtonStyle(),
              onPressed: () {
                ContactBook().add(
                  name: nameController.text,
                  age: ageController.text,
                  phoneNumber: phoneNumberController.text,
                );
                Navigator.of(context).pop();
              },
              child: const Text(
                'Add Contact',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
