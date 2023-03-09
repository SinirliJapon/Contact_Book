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
  final String name = " ";

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
                  'Add a new Contact',
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
                labelText: "Contact's Name",
                hintText: "Enter contact's name ...",
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(
                height: 8.0,
              ),
              contactField(
                controller: ageController,
                decoration: kTextFieldDecoration,
                labelText: "Contact's Age",
                hintText: "Enter contact's age ...",
                prefixIcon: const Icon(Icons.numbers),
              ),
              const SizedBox(
                height: 8.0,
              ),
              contactField(
                controller: phoneNumberController,
                decoration: kTextFieldDecoration,
                labelText: "Contact's Phone Number",
                hintText: "Enter contact's phone number ...",
                prefixIcon: const Icon(Icons.phone),
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
                    isFavorite: false,
                  );
                  FocusScope.of(context).unfocus();
                },
                child: const Text(
                  'Add Contact',
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
