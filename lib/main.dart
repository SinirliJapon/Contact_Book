import 'package:contactbook/utils/constants.dart';
import 'package:contactbook/model/contact.dart';
import 'package:contactbook/screens/contact_screen.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<Contact>(ContactAdapter());
  await Hive.openBox<Contact>(contactBoxName);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Book',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryColor,
          foregroundColor: kForegroundColor,
        ),
      ),
      home: const ContactScreen(),
    );
  }
}
