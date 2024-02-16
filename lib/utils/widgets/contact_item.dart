import 'package:contactbook/model/contact.dart';
import 'package:contactbook/repository/contact_book.dart';
import 'package:contactbook/screens/contact_info_screen.dart';
import 'package:contactbook/utils/widgets/contact_slidable_action.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactItem extends StatefulWidget {
  final Contact contact;
  const ContactItem({super.key, required this.contact});

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        direction: Axis.horizontal,
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const ScrollMotion(),
          children: [ContactSlidableAction(contact: widget.contact)],
        ),
        key: ValueKey(widget.contact.id),
        child: Material(
          elevation: 4.0,
          child: ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ContactInfoScreen(currentContact: widget.contact))),
            leading: ProfilePicture(name: widget.contact.name, radius: 25, fontsize: 15),
            title: Text(widget.contact.name),
            trailing: FavoriteButton(
              iconSize: 40,
              isFavorite: widget.contact.isFavorite,
              valueChanged: (isFavorite) {
                setState(() {
                  widget.contact.isFavorite = isFavorite;
                });
                ContactBook().update(widget.contact);
              },
            ),
          ),
        ),
      ),
    );
  }
}
