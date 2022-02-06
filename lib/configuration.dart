import 'package:flutter/material.dart';

Color primaryGreen = Color(0xff416d6d); //Color definition

List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey.shade300, blurRadius: 30, offset: Offset(0, 10))
]; //Creates Box-Shadow behind Widgets/Containers

List<Map> categories = [
  //path to Images
  {'name': 'Cats', 'iconPath': 'assets/images/cat.png'},
  {'name': 'Dogs', 'iconPath': 'assets/images/dog.png'},
  {'name': 'Bunnies', 'iconPath': 'assets/images/rabbit.png'},
  {'name': 'Parrots', 'iconPath': 'assets/images/parrot.png'},
  {'name': 'Horses', 'iconPath': 'assets/images/horse.png'},
];
