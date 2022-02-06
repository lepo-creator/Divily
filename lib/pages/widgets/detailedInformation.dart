import 'package:divily/configuration.dart';
import 'package:flutter/material.dart';

class DetailedInformationCard extends StatelessWidget {
  const DetailedInformationCard({Key? key}) : super(key: key);

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
                      color: Colors.teal.shade100,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50, bottom: 50),
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
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 80),
                        Text('Hallo'),
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
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.teal
                                          .shade300, //color declaration always in decoration if used
                                    ),
                                    child: Icon(
                                      Icons.star_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.teal.shade300,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Kaufen',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.lightGreen
                                  .shade200, //when using decoration environment color has to be declared inside!
                              borderRadius: BorderRadius.circular(20),
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
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  IconButton(icon: Icon(Icons.share), onPressed: () {}),
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
                        Text('Artikelname',
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
                        Text('Basisinformationen zum Artikel'),
                        Text('Weitere Infos'),
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
