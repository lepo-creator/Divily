import 'package:flutter/cupertino.dart'; // imports cupertino package for fancy layouts
import 'package:flutter/material.dart'; // imports material package for material app class

class Page1 extends StatelessWidget {
  static Route<dynamic> route() {
    return CupertinoPageRoute(
      builder: (BuildContext context) {
        return Page1();
      },
    );
  }

  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Suche'),
          backgroundColor: Colors.teal.shade300,
        ),
        body: Center(
            child: ElevatedButton(
                child: Text('Suchen'),
                onPressed: () =>
                    Navigator.of(context).push(SearchPage.route()))),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  static Route<dynamic> route() {
    return CupertinoPageRoute(
      builder: (BuildContext context) {
        return SearchPage();
      },
    );
  }

  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            child: const Text('Zurück'),
            onPressed: () => Navigator.pop(context)));
  }
}
