import 'package:flutter/cupertino.dart'; // imports cupertino package for fancy layouts
import 'package:flutter/material.dart'; // imports material package for material app class
import 'package:google_fonts/google_fonts.dart';

//own imports
import 'package:divily/configuration.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: middleGreen,
        ),
        body: ListOfAdverts(),
      ),
    );
  }
}

class ListOfAdverts extends StatelessWidget {
  const ListOfAdverts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //Row for categories
      //height: 110,
      child: ListView.builder(
        scrollDirection: Axis.vertical, //Scrolling direction
        itemCount: adverts
            .length, //ListView as long as categories from file configuration.dart
        itemBuilder: (context, index) {
          return Container(
            height: 150,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            decoration: BoxDecoration(
              color: primaryWhite,
              borderRadius: BorderRadius.circular(10),
              boxShadow: shadowList,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: lightBeige,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: shadowList2,
                        ),
                      ),
                      Align(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Image.asset(
                            adverts[index]['imagePath'],
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  //Information text next to the picture
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: 15,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              adverts[index]['title'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 100,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(adverts[index]['info']),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
