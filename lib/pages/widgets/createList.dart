import 'package:flutter/cupertino.dart'; // imports cupertino package for fancy layouts
import 'package:flutter/material.dart'; // imports material package for material app class
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart'; // imports Parse Server lib for Back4App

//import other files of divily
import 'package:divily/configuration.dart';
import 'detailedPage.dart';
import 'package:divily/pages/newAdvert.dart';
import 'filterRow.dart';

class ListOfAds extends StatelessWidget {
  const ListOfAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: middleGreen,
        ),
        body: CreateList(),
      ),
    );
  }
}

class CreateList extends StatelessWidget {
  const CreateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        FilterRow(),
        Expanded(
          child: FutureBuilder<List<ParseObject>>(
              future: getAdvert(), //function to get the strings from back4app
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: Container(
                          width: 50,
                          height: 50,
                          child:
                              CircularProgressIndicator()), //Shows loading state
                    );
                  default:
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error..."),
                      );
                    }
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text("No Data..."),
                      );
                    } else {
                      return ListView.builder(
                          // Creates list with adverts
                          scrollDirection: Axis.vertical, //Scrolling direction
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final varAdvert = snapshot.data![index];
                            final varTitle = varAdvert.get<String>(
                                'title')!; //definition of variables for use of saved strings in back4app
                            final varInfo = varAdvert.get<String>('info')!;

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailedPage(
                                              varTitle: varAdvert.get<String>(
                                                  'title')!, //passing variable to DetailedPage
                                              varInfo: varAdvert.get<String>(
                                                  'info')!, //passing variable to DetailedPage
                                            )));
                              },
                              child: Container(
                                //layout of adverts
                                height: 150,
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: shadowList2,
                                            ),
                                          ),
                                          Align(
                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              //child: Image.asset(
                                              //adverts[index]['imagePath'],
                                              //fit: BoxFit.contain,
                                              //),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      //Information text next to the picture
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5),
                                              height: 15,
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  varTitle,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                                child: Text(varInfo),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                }
              }),
        ),
      ],
    );
  }

  Future<List<ParseObject>> getAdvert() async {
    //function to get the information from back4app
    QueryBuilder<ParseObject> queryAdvert =
        QueryBuilder<ParseObject>(ParseObject('Todo'));
    final ParseResponse apiResponse = await queryAdvert.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }
}
