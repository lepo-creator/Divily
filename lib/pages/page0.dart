import 'package:flutter/cupertino.dart'; // imports cupertino package for fancy layouts
import 'package:flutter/material.dart'; // imports material package for material app class

class Page0 extends StatelessWidget {
  //Page 0
  static Route<dynamic> route() {
    return CupertinoPageRoute(
      builder: (BuildContext context) {
        return Page0();
      },
    );
  }

  const Page0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: SizedBox(
            height: 30.0,
            child: Image.asset(
              'assets/images/logo2.png',
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: Colors.teal.shade300,
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              flexibleSpace: AppBar(
                centerTitle: true,
                title: Text('Titel'),
                backgroundColor: Colors.grey.shade400,
              ),
              expandedHeight: 50,
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item #$index')),
              childCount: 100,
            ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.grey.shade500,
            child: const Icon(Icons.grade)),
      ),
    );
  }
}