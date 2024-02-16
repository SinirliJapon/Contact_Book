import 'package:contactbook/utils/constants.dart';
import 'package:contactbook/repository/contact_book.dart';
import 'package:contactbook/utils/widgets/contact_field.dart';
import 'package:flutter/material.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});
  static String id = 'add_contact_screen';

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
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
      appBar: AppBar(title: const Text('Add Contact')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              foregroundColor: kForegroundColor,
              backgroundColor: kPrimaryColor,
              child: Icon(Icons.person_2_outlined, size: 40),
            ),
            const SizedBox(height: 50),
            ContactField(
              controller: nameController,
              decoration: kTextFieldDecoration,
              labelText: "Contact's Name",
              hintText: "Enter contact's name ...",
              prefixIcon: const Icon(Icons.person),
            ),
            const SizedBox(height: 8.0),
            ContactField(
              controller: ageController,
              decoration: kTextFieldDecoration,
              labelText: "Contact's Age",
              hintText: "Enter contact's age ...",
              prefixIcon: const Icon(Icons.numbers),
            ),
            const SizedBox(height: 8.0),
            ContactField(
              controller: phoneNumberController,
              decoration: kTextFieldDecoration,
              labelText: "Contact's Phone Number",
              hintText: "Enter contact's phone number ...",
              prefixIcon: const Icon(Icons.phone),
            ),
            const SizedBox(height: 20),
            TextButton(
              style: kTextButtonStyle,
              onPressed: () {
                ContactBook().add(
                  name: nameController.text,
                  age: ageController.text,
                  phoneNumber: phoneNumberController.text,
                  isFavorite: false,
                );
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Contact Added..."),
                  backgroundColor: kPrimaryColor,
                ));
                FocusScope.of(context).unfocus();
                Navigator.pop(context);
              },
              child: const Text('Add Contact', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
