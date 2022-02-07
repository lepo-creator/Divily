import 'package:flutter/cupertino.dart'; // imports cupertino package for fancy layouts
import 'package:flutter/material.dart'; // imports material package for material app class
import 'package:google_fonts/google_fonts.dart';

import 'widgets/homeScreen.dart'; //imports file for HomeScreen Widget
import 'widgets/drawerScreen.dart'; //imports file for DrawerScreen Widget

class Messenger extends StatelessWidget {
  //const Messenger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            DrawerScreen(),
            HomeScreen(),
          ],
        ),
      ),
    );
  }
}
