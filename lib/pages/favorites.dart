import 'package:flutter/cupertino.dart'; // imports cupertino package for fancy layouts
import 'package:flutter/material.dart'; // imports material package for material app class
import 'package:google_fonts/google_fonts.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme:
              IconThemeData(color: Colors.black), // Color for icons in AppBar
        ),

        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.teal.shade200,
        iconTheme: IconThemeData(color: Colors.black), //Color for icons
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: SizedBox(
            height: 30.0,
            child: Image.asset(
              'assets/images/cat.png',
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: Colors.teal.shade300,
        ),
      ),
    );
  }
}
