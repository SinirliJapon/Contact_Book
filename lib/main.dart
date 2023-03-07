import 'package:contactbook/constants.dart';
import 'package:contactbook/model/contact.dart';
import 'package:contactbook/screens/add_new_contact_screen.dart';
import 'package:contactbook/screens/favorite_screen.dart';
import 'package:contactbook/screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<Contact>(ContactAdapter());
  await Hive.openBox<Contact>(contactBoxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Book',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryColor,
        ),
      ),
      home: const HomePage(),
      routes: {
        AddNewContactScreen.id: (context) => const AddNewContactScreen(),
        HomePage.id: (context) => const HomePage(),
        FavoriteScreen.id: (context) => const FavoriteScreen(),
      },
    );
  }
}
