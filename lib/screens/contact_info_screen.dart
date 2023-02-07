import 'package:contactbook/model/contact.dart';
import 'package:flutter/material.dart';
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: kContactInfoBoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Center(
                      child: Text(
                    currentContact.name,
                    style: const TextStyle(color: Colors.white),
                  )),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                decoration: kContactInfoBoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Center(
                      child: Text(
                    currentContact.age,
                    style: const TextStyle(color: Colors.white),
                  )),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                decoration: kContactInfoBoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Center(
                      child: Text(
                    currentContact.phoneNumber,
                    style: const TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
