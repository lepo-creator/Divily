import 'package:flutter/cupertino.dart'; // imports cupertino package for fancy layouts
import 'package:flutter/material.dart'; // imports material package for material app class
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart'; // imports Parse Server lib for Back4App

//import other files of divily
import 'package:divily/configuration.dart';
import 'widgets/detailedPage.dart';

class Test extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Test> {
  final advertTitleController = TextEditingController();
  final advertInfoController = TextEditingController();
  final advertPriceController = TextEditingController();
  final advertDetailController = TextEditingController();

  void addAdvert() async {
    await saveAdvert(advertTitleController.text, advertInfoController.text,
        advertPriceController.text, advertDetailController.text);
    setState(() {
      advertTitleController.clear();
      advertInfoController.clear();
      advertPriceController.clear();
      advertDetailController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Neue Anzeige erstellen"), //AppBar with title
        backgroundColor: middleGreen,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 5),
                    child: Align(
                        child: Text('Titel'), alignment: Alignment.topLeft),
                  ),
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
                            prefixIcon: Icon(Icons.title_rounded),
                            hintStyle: TextStyle(color: Colors.grey.shade600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 5),
                    child: Align(
                        child: Text('Kurzbeschreibung'),
                        alignment: Alignment.topLeft),
                  ),
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
                              prefixIcon: Icon(Icons.short_text_rounded),
                              hintStyle:
                                  TextStyle(color: Colors.grey.shade600)),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 5),
                    child: Align(
                        child: Text('Preis (€/Tag)'),
                        alignment: Alignment.topLeft),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          autocorrect: false,
                          textCapitalization: TextCapitalization.sentences,
                          controller: advertPriceController, //Textfield price
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "Preis eingeben",
                              prefixIcon: Icon(Icons.euro_rounded),
                              hintStyle:
                                  TextStyle(color: Colors.grey.shade600)),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 5),
                    child: Align(
                        child: Text('Details'), alignment: Alignment.topLeft),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          maxLines: 6,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.sentences,
                          controller:
                              advertDetailController, //Textfield for additional informations on the product
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText:
                                  "Detaillierte Beschreibung zum Produkt einfügen",
                              prefixIcon: Icon(Icons.notes_rounded),
                              hintStyle:
                                  TextStyle(color: Colors.grey.shade600)),
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
                    child: Text("Anzeige erstellen"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveAdvert(
      String title, String info, String price, String detail) async {
    //function for creating a new entry in back4app
    final ad = ParseObject('Todo') //path to the folder
      ..set('title', title) //path to the column of back4app
      ..set('info', info)
      ..set('price', price)
      ..set('detail', detail);

    await ad.save();
  }
}
