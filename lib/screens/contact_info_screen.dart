import 'package:contactbook/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import '../widgets.dart';

class ContactInfoScreen extends StatelessWidget {
  static String id = 'info_screen';
  final Contact currentContact;
  const ContactInfoScreen({super.key, required this.currentContact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact's info"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 24.0,
              ),
              // ignore: prefer_const_constructors
              ProfilePicture(
                name: currentContact.name,
                radius: 50,
                fontsize: 20,
              ),
              const SizedBox(
                height: 8.0,
              ),
              contactContainer(info: currentContact.name),
              const SizedBox(
                height: 8.0,
              ),
              contactContainer(info: currentContact.age),
              const SizedBox(
                height: 8.0,
              ),
              contactContainer(info: currentContact.phoneNumber),
            ],
          ),
        ),
      ),
    );
  }
}
