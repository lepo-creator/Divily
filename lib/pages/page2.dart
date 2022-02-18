import 'package:flutter/cupertino.dart'; // imports cupertino package for fancy layouts
import 'package:flutter/material.dart'; // imports material package for material app class
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart'; // imports Parse Server lib for Back4App

//own imports
import './widgets/login.dart';
import './widgets/registration.dart';
import 'package:divily/configuration.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  Future<bool> hasUserLogged() async {
    //gets the user login token information from parse Server
    ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
    if (currentUser == null) {
      return false;
    }
    //Checks whether the user's session token is valid
    final ParseResponse? parseResponse =
        await ParseUser.getCurrentUserFromServer(currentUser.sessionToken!);

    if (parseResponse?.success == null || !parseResponse!.success) {
      //Invalid session. Logout
      await currentUser.logout();
      return false;
    } else {
      return true;
    }
  }

  late final Future<bool>? myFuture; //defines dynamic future variable

  @override
  void initState() {
    super.initState();
    myFuture =
        hasUserLogged(); //defines futurevariable in initState ->not effected by rebuild see https://stackoverflow.com/questions/57793479/flutter-futurebuilder-gets-constantly-called
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<bool>(
          future:
              myFuture, // defines "const" future variable as input for build
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Scaffold(
                  body: Center(
                    child: Container(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator()),
                  ),
                );
              default:
                if (snapshot.hasData && snapshot.data!) {
                  return UserPage();
                } else {
                  return const NoUserPage();
                }
            }
          }),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // State maybe not needed
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class NoUserPage extends StatelessWidget {
  const NoUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Account'),
          backgroundColor: middleGreen,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(darkGrey)),
                    child: const Text('Einloggen'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserLoginPage()));
                    }),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(darkGrey)),
                  child: const Text('Registrierung'),
                  onPressed: () {
                    Navigator.of(context).push(RegistrationPage.route());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// USER LOGIN PART

class Message {
  static void showSuccess(
      {required BuildContext context,
      required String message,
      VoidCallback? onPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Erfolg!"),
          content: Text(message),
          actions: <Widget>[
            new ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                if (onPressed != null) {
                  onPressed();
                }
              },
            ),
          ],
        );
      },
    );
  }

  static void showError(
      {required BuildContext context,
      required String message,
      VoidCallback? onPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Fehler!"),
          content: Text(message),
          actions: <Widget>[
            new ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                if (onPressed != null) {
                  onPressed();
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class UserPage extends StatelessWidget {
  ParseUser? currentUser;
  static Route<dynamic> route() {
    return CupertinoPageRoute(
      builder: (BuildContext context) {
        return UserPage();
      },
    );
  }

  Future<ParseUser?> getUser() async {
    currentUser = await ParseUser.currentUser() as ParseUser?;
    return currentUser;
  }

  @override
  Widget build(BuildContext context) {
    void doUserLogout() async {
      var response = await currentUser!.logout();
      if (response.success) {
        Message.showSuccess(
            context: context,
            message: 'Benutzer erfolgreich ausgeloggt!',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Page2()),
                (Route<dynamic> route) => false,
              );
            });
      } else {
        Message.showError(context: context, message: response.error!.message);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Benutzerseite'),
          backgroundColor: middleGreen,
        ),
        body: FutureBuilder<ParseUser?>(
            future: getUser(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: Container(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator()),
                  );
                default:
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Text('Hallo, ${snapshot.data!.username}')),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 50,
                          child: ElevatedButton(
                            child: const Text('Ausloggen'),
                            onPressed: () => doUserLogout(),
                          ),
                        ),
                      ],
                    ),
                  );
              }
            }));
  }
}
