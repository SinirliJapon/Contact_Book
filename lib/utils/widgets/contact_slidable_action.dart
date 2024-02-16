import 'package:contactbook/utils/constants.dart';
import 'package:contactbook/model/contact.dart';
import 'package:contactbook/repository/contact_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactSlidableAction extends StatelessWidget {
  final Contact contact;
  const ContactSlidableAction({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      backgroundColor: kSlidableBackgrondColor,
      foregroundColor: kForegroundColor,
      icon: Icons.delete,
      label: 'Delete',
      spacing: 4,
      onPressed: (context) {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => AlertDialog(
            title: const Text("Confirm Deletion"),
            content: const Text("Are you sure you want to delete this contact?"),
            titlePadding: const EdgeInsets.all(20.0),
            contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            backgroundColor: kForegroundColor,
            alignment: Alignment.center,
            elevation: 2,
            actions: [
              TextButton(
                child: const Text('Delete Contact', style: TextStyle(color: kPrimaryColor)),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: kPrimaryColor,
                      content: Text("Contact Deleted..."),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                  ContactBook().remove(id: contact.id);
                  Navigator.pop(context);
                },
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel', style: TextStyle(color: kPrimaryColor)),
              ),
            ],
          ),
        );
      },
    );
  }
}
