import 'package:flutter/cupertino.dart';
import 'package:divily/configuration.dart';
import 'package:flutter/material.dart';

//own imports
import 'package:divily/configuration.dart';
import 'package:divily/pages/widgets/detailedInformation.dart';

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
        ..scale(scaleFactor), //moving Container
      duration: Duration(milliseconds: 250),
      color: primaryWhite,
      child: SingleChildScrollView(
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
                        children: [Icon(Icons.room_rounded), Text('Germany')],
                      ),
                    ],
                  ),
                  Container(
                    child: CircleAvatar(radius: 25.0),
                    decoration: BoxDecoration(
                        boxShadow: shadowList,
                        borderRadius: BorderRadius.circular(
                            25.0)), //Shadow of the Circle Avatar
                  ),
                ],
              ),
            ),
            Container(
              //Search line/window with Icons and Dimensions
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: primaryWhite,
                borderRadius:
                    BorderRadius.circular(35), //rounded edges of search line
                boxShadow: shadowList,
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, //sets text in the middle
                children: [
                  Icon(Icons.search_rounded),
                  Text('Search pet to adopt'),
                  Icon(Icons.settings),
                ],
              ),
            ),
            Container(
              //Row for categories
              height: 110,
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
                                  height:
                                      2), //distance between icon/image and text
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
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailedInformationCard())); //Navigation to the Page with detailed Informations on the Item
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: primaryWhite,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: shadowList,
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
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
                                'assets/images/horse.png',
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              height: 15,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Titel des Produkts',
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
                                child: Text(
                                    'Weitere Informationen zum Produkt stehen hier, aber möglicherweise entsteht ein Problem, wenn der Text zu lang wird'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), //Distance between the two widgets
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: primaryWhite,
                borderRadius: BorderRadius.circular(10),
                boxShadow: shadowList,
              ),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: lightGreen,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: shadowList2,
                          ),
                        ),
                        Align(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/images/horse.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text('Hallo'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), //Distance between the two widgets
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: primaryWhite,
                borderRadius: BorderRadius.circular(10),
                boxShadow: shadowList,
              ),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: lightGreen,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: shadowList2,
                          ),
                        ),
                        Align(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/images/horse.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text('Hallo'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), //Distance between the two widgets
          ],
        ),
      ),
    );
  }
}
