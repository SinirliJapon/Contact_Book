import 'package:contactbook/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen({super.key});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact's info"),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Contact>('contacts').listenable(),
        builder: (context, value, child) {
          final contacts = value.values.toList();
          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      decoration: kBoxDecoration(),
                      child: Center(
                        child: Text(
                          contact.name,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      decoration: kBoxDecoration(),
                      child: Center(
                        child: Text(contact.age),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      decoration: kBoxDecoration(),
                      child: Center(
                        child: Text(contact.phoneNumber),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
