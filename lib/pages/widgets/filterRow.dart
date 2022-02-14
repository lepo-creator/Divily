import 'package:flutter/cupertino.dart'; // imports cupertino package for fancy layouts
import 'package:flutter/material.dart'; // imports material package for material app class
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart'; // imports Parse Server lib for Back4App

//import other files of divily
import 'package:divily/configuration.dart';
import 'detailedPage.dart';
import 'package:divily/pages/newAdvert.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //Row for categories
      height: 100,
      decoration: BoxDecoration(),
      child: ListView.builder(
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
                    color: verylightGreen,
                    boxShadow: shadowList,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(children: [
                      Image.asset(
                        categories[index][
                            'iconPath'], //refers to ListView from configuration.dart
                        height: 50,
                        width: 50,
                        color: primaryBlack,
                      ),
                      SizedBox(
                          height: 2), //distance between icon/image and text
                      Text(
                        categories[index][
                            'name'], //refers to ListView from configuration.dart
                      ),
                    ]),
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
