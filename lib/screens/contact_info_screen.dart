import 'package:contactbook/constants.dart';
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
      appBar: AppBar(),
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
                name: currentContact.name,
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
              contactButton(
                  info: currentContact.name, icon: const Icon(Icons.person)),
              const SizedBox(
                height: 8.0,
              ),
              contactButton(
                  info: currentContact.age, icon: const Icon(Icons.numbers)),
              const SizedBox(
                height: 8.0,
              ),
              contactButton(
                  info: currentContact.phoneNumber,
                  icon: const Icon(Icons.phone)),
            ],
          ),
        ),
      ),
    );
  }
}
