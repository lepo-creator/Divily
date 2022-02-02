import 'package:flutter/cupertino.dart'; // imports cupertino package for fancy layouts
import 'package:flutter/material.dart'; // imports material package for material app class

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: SizedBox(
            height: 30.0,
            child: Image.asset(
              'assets/images/logo2.png',
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: Colors.teal.shade300,
        ),
      ),
    );
  }
}
