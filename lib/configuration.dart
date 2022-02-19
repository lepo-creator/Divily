import 'package:flutter/material.dart';

//Color primaryTeal = Colors.teal.shade100; //Color definition
Color darkGreen = const Color(0xFF5D7B6F);
Color middleGreen = const Color(0xFFA4C3A2);
Color lightGreen = const Color(0xFFB0D4B8);
Color verylightGreen = const Color(0xFFE4f1E8);
Color lightBlue = const Color(0xFFD7F9FA);
Color verylightBlue = const Color(0xFFEDFDFD);
Color lightBeige = const Color(0xFFEAE7D6);
Color darkGrey = const Color(0xFF2F3431);
Color primaryBlack = const Color(0xFF000000);
Color primaryWhite = const Color(0xFFFFFFFF);

List<BoxShadow> shadowList = [
  BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.24),
      blurRadius: 8,
      offset: const Offset(0, 3))
]; //Creates Box-Shadow behind Widgets/Containers

List<BoxShadow> shadowList2 = [
  BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.24),
      blurRadius: 8,
      offset: const Offset(0, 0))
];

List<Map> categories = [
  //path to Images in Filter/Categories line
  {'name': 'Cats', 'iconPath': 'assets/images/cat.png'},
  {'name': 'Dogs', 'iconPath': 'assets/images/dog.png'},
  {'name': 'Bunnies', 'iconPath': 'assets/images/rabbit.png'},
  {'name': 'Parrots', 'iconPath': 'assets/images/parrot.png'},
  {'name': 'Horses', 'iconPath': 'assets/images/horse.png'},
];

// The DismissKeybaord widget to make the keyboard go away when you click outside a textfield
class DismissKeyboard extends StatelessWidget {
  final Widget child;
  const DismissKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
