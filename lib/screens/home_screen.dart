import 'package:contactbook/model/contact.dart';
import 'package:contactbook/repository/contactBook.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Book'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Contact>('contacts').listenable(),
        builder: (context, value, child) {
          final contacts = value.values.toList();
          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return Dismissible(
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("contact deleted"),
                    ),
                  );
                  ContactBook().remove(id: contact.id);
                },
                key: ValueKey(contact.id),
                background: Container(
                  color: Colors.red,
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                child: Material(
                  color: Colors.white,
                  elevation: 6.0,
                  child: TextButton(
                    onPressed: () async {
                      await Navigator.of(context).pushNamed('/contact-info');
                    },
                    child: ListTile(
                      title: Text(contact.name),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed('/new-contact');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
