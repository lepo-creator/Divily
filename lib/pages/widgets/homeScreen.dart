//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:divily/configuration.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0; //Offset values for tab on the menu button
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false; //tells if drawer is open or not

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor), //moving COntainer
      duration: Duration(milliseconds: 250),
      color: Colors.grey.shade100,

      child: Column(
        children: [
          SizedBox(height: 50),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen //drawer open => back button; drawer closed => open
                    ? IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            scaleFactor = 1;
                            isDrawerOpen = false;
                          });
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          setState(() {
                            xOffset = 230;
                            yOffset = 150;
                            scaleFactor = 0.6;
                            isDrawerOpen = true;
                          });
                        }),
                Column(
                  //Shows Location in the top middle
                  children: [
                    Text('Location'),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: primaryGreen,
                        ),
                        Text('Germany')
                      ],
                    ),
                  ],
                ),
                CircleAvatar(),
              ],
            ),
          ),
          Container(
            //Search line/window with Icons and Dimensions
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.search),
                Text('Search pet to adopt'),
                Icon(Icons.settings),
              ],
            ),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              //Row for categories
              scrollDirection: Axis.horizontal, //Scrolling direction
              itemCount: categories
                  .length, //ListView as long as categories from file configuration.dart
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: shadowList,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          categories[index][
                              'iconPath'], //refers to ListView from configuration.dart
                          height: 50,
                          width: 50,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Text(
                        categories[index]['name'],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
              height: 240,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[300],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: shadowList,
                        ),
                        margin: EdgeInsets.only(top: 50),
                      ),
                      Align(
                        child: Image.asset('assets/images/pet-cat1.png'),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(top: 60, bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: shadowList,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ))
              ]))
        ],
      ),
    );
  }
}
