import 'package:contactbook/constants.dart';
import 'package:contactbook/model/contact.dart';
import 'package:contactbook/repository/contact_book.dart';
import 'package:contactbook/screens/add_new_contact_screen.dart';
import 'package:contactbook/screens/contact_info_screen.dart';
import 'package:contactbook/widgets.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  static String id = 'favorite_screen';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text('Favorite Screen'),
      ),
    );
  }
}
