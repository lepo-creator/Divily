import 'package:flutter/cupertino.dart'; // imports cupertino package for fancy layouts
import 'package:flutter/material.dart'; // imports material package for material app class
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart'; // imports Parse Server lib for Back4App

//own imports
import 'package:divily/configuration.dart';
import './pages/page1.dart';
import './pages/page0.dart';
import './pages/page2.dart';
import './pages/favorites.dart';
import './pages/messenger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId =
      'ZTWCaFgK1pQYJgJWyNn2U6AezIGummd88zSMZxXp'; // Userinformation for Back4App
  final keyClientKey = 'Q8k324wS6Fwhie0QQa4RbTZXN0QpXVuWXcx99lGQ';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId,
      keyParseServerUrl, // Connects Divily with the Back4APP Backend
      clientKey: keyClientKey,
      autoSendSessionId: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner:
          false, // Define Materiallocalisator for cupertino link betwenn android and materialapp
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ], // Defines Materiallocalisation for cupertino app
      //Bottom Navigation Bar with Tabs
      home: MyHomePage(),
      routes: {
        // 'p0': (_) => Page1(),
        // 'registration': (_) => Registration(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: middleGreen,
        items: const <BottomNavigationBarItem>[
          //Icons for Bottom Navigation Bar with Tabs !Keep in this order!
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_rounded, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline_rounded, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined, color: Colors.white),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        //different cases for Bottom Navigation Bar; default = first Icon
        switch (index) {
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Favorites(),
              );
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Home(),
              );
            });
          case 3:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Messenger(),
              );
            });
          case 4:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Page2(),
              );
            });
          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Page0(),
              );
            });
        }
      },
    );
  }
}
