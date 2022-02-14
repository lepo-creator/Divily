import 'package:flutter/material.dart';

//own imports
import 'package:divily/configuration.dart';

class DetailedPage extends StatelessWidget {
  final String varTitle; //get variables from previous page
  final String varInfo;

  const DetailedPage(
      {Key? key,
      required this.varTitle,
      required this.varInfo}) //get variables from previous page
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Column(
            //background with two colors
            children: [
              Expanded(
                //Expanded for equal space for each Container
                child: Stack(
                  children: [
                    Container(
                      color: lightBeige,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50, bottom: 55),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                            'assets/images/cat.png'), //Container with image inside
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: primaryWhite,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 80),
                        Text('Hallo'), //text
                        SizedBox(height: 100),
                        Text('Hallo'),
                        SizedBox(height: 100),
                        Align(
                          //Bottom widget with buttons
                          alignment:
                              Alignment.bottomCenter, //position of widget
                          child: Container(
                            height: 100,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      20), //distance to the edges in horizontal direction
                              child: Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            darkGreen), //color declaration always in decoration if used
                                    child: Icon(Icons.favorite_border_rounded,
                                        color: primaryWhite, size: 30.0),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: middleGreen,
                                        borderRadius: BorderRadius.circular(35),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Jetzt mieten',
                                          style: TextStyle(
                                              color: primaryBlack,
                                              fontSize: 24),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
          Container(
            margin: EdgeInsets.only(top: 40),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_rounded),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  IconButton(
                      icon: Icon(Icons.ios_share_rounded), onPressed: () {}),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 100,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: shadowList,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(varTitle,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold)),
                        Icon(Icons.home_rounded),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(varInfo),
                        //Text('Weitere Infos'),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      children: [
                        Icon(Icons.room_rounded),
                        SizedBox(width: 5),
                        Text('Location'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
