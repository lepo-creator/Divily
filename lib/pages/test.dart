import 'package:flutter/cupertino.dart'; // imports cupertino package for fancy layouts
import 'package:flutter/material.dart'; // imports material package for material app class
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart'; // imports Parse Server lib for Back4App

//import other files of divily
import 'package:divily/configuration.dart';

class Test extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Test> {
  final advertTitleController = TextEditingController();
  final advertInfoController = TextEditingController();

  void addAdvert() async {
    await saveAdvert(advertTitleController.text, advertInfoController.text);
    setState(() {
      advertTitleController.clear();
      advertInfoController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anzeigen"),
        backgroundColor: middleGreen,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 210,
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: primaryWhite,
              borderRadius:
                  BorderRadius.circular(35), //rounded edges of search line
              boxShadow: shadowList,
            ),
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        autocorrect: false,
                        textCapitalization: TextCapitalization.sentences,
                        controller:
                            advertTitleController, // Textfield for the title of the advert
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Titel eingeben",
                            hintStyle: TextStyle(color: darkGrey)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        autocorrect: false,
                        textCapitalization: TextCapitalization.sentences,
                        controller:
                            advertInfoController, //Textfield for additional informations on the product
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Produktbeschreibung eingeben",
                            hintStyle: TextStyle(color: darkGrey)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    onPrimary: primaryWhite,
                    primary: darkGreen,
                  ),
                  onPressed:
                      addAdvert, //runs function for saving the strings when pressed
                  child: Text("OK"),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<ParseObject>>(
                future: getAdvert(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: Container(
                            width: 100,
                            height: 100,
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
                            scrollDirection:
                                Axis.vertical, //Scrolling direction
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final varAdvert = snapshot.data![index];
                              final varTitle = varAdvert.get<String>(
                                  'title')!; //definition of variables for use of saved strings in back4app
                              final varInfo = varAdvert.get<String>('info')!;

                              return Container(
                                //layout of adverts
                                height: 150,
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
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
                              );
                            });
                      }
                  }
                }),
          ),
        ],
      ),
    );
  }

  Future<void> saveAdvert(String title, String info) async {
    //function for creating a new entry in back4app
    final ad = ParseObject('Todo') //path to the folder
      ..set('title', title) //path to the column of back4app
      ..set('info', info);
    await ad.save();
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
