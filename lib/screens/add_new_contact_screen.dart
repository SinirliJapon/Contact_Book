import 'package:contactbook/constants.dart';
import 'package:contactbook/repository/contactBook.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class AddNewContactScreen extends StatefulWidget {
  const AddNewContactScreen({super.key});
  static const name = '/add-new-contact';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter contact's name"),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              controller: ageController,
              decoration: kTextFieldDecoration.copyWith(
                hintText: "Enter contact's age ...",
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              controller: phoneNumberController,
              decoration: kTextFieldDecoration.copyWith(
                hintText: "Enter contact's phone number ...",
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            TextButton(
              style: kTextButtonStyle(),
              onPressed: () {
                ContactBook().add(
                    name: nameController.text,
                    age: ageController.text,
                    phoneNumber: phoneNumberController.text);
                Navigator.of(context).pop();
              },
              child: const Text(
                'Add Contact',
                style: TextStyle(
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
