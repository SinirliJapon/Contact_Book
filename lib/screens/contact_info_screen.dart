import 'package:contactbook/utils/constants.dart';
import 'package:contactbook/model/contact.dart';
import 'package:contactbook/repository/contact_book.dart';
import 'package:contactbook/utils/widgets/contact_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class ContactInfoScreen extends StatefulWidget {
  static String id = 'info_screen';
  final Contact currentContact;

  const ContactInfoScreen({Key? key, required this.currentContact}) : super(key: key);

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.currentContact.name);
    ageController = TextEditingController(text: widget.currentContact.age);
    phoneNumberController = TextEditingController(text: widget.currentContact.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Info')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfilePicture(name: nameController.text, radius: 50, fontsize: 30),
            const SizedBox(height: 50),
            ContactField(
              controller: nameController,
              decoration: kTextFieldDecoration,
              labelText: 'Edit Contact Name',
              hintText: 'New Contact Name',
              prefixIcon: const Icon(Icons.person),
            ),
            const SizedBox(height: 20),
            ContactField(
              controller: ageController,
              decoration: kTextFieldDecoration,
              labelText: 'Edit Contact Age',
              hintText: 'New Contact Age',
              prefixIcon: const Icon(Icons.numbers),
            ),
            const SizedBox(height: 20),
            ContactField(
              controller: phoneNumberController,
              decoration: kTextFieldDecoration,
              labelText: 'Edit Contact Phone Number',
              hintText: 'New Contact Phone Number',
              prefixIcon: const Icon(Icons.phone),
            ),
            const SizedBox(height: 20),
            TextButton(
              style: kTextButtonStyle,
              onPressed: () {
                FocusScope.of(context).unfocus();
                ContactBook().editContact(
                  id: widget.currentContact.id,
                  name: nameController.text,
                  age: ageController.text,
                  phoneNumber: phoneNumberController.text,
                  isFavorite: widget.currentContact.isFavorite,
                );
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Contact Updated...")));
                Navigator.pop(context);
              },
              child: const Text('Update Contact', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
