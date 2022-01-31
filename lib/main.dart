import 'package:flutter/cupertino.dart'; // imports cupertino package for fancy layouts
import 'package:flutter/material.dart'; // imports material package for material app class
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart'; // imports Parse Server lib for Back4App
//import 'package:provider/provider.dart';

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
      //Bottom Navigation Bar with Tabs
      debugShowCheckedModeBanner: false,
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
        backgroundColor: Colors.teal.shade300,
        items: const <BottomNavigationBarItem>[
          //Icons for Bottom Navigation Bar with Tabs !Keep in this order!
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded, color: Colors.white),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        //different cases for Bottom Navigation Bar; default = first Icon
        switch (index) {
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Page1(),
              );
            });
          case 2:
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
        body: Center(
          child: Text('Hallo'),
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  //Page 1
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Titel Seite 1'),
          backgroundColor: Colors.teal.shade300,
        ),
        body: const Center(
          child: Text('Hallo Page 1'),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  //Page 2
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Titel Seite 2'),
          backgroundColor: Colors.teal.shade300,
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
                      child: const Text('Einloggen'),
                      onPressed: () =>
                          Navigator.of(context).push(RegistrationPage.route())),
                  ElevatedButton(
                    child: const Text('Test Page'),
                    onPressed: () {
                      Navigator.of(context).push(TestPage.route());
                    },
                  )
                ],
              )
            ]),
      ),
    );
  }
}

// USER LOGIN PART

class TestPage extends StatelessWidget {
  static Route<dynamic> route() {
    return CupertinoPageRoute(
      builder: (BuildContext context) {
        return TestPage();
      },
    );
  }

  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // appBar: AppBar(
      //   title: const Text('Registierung'),
      // ),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Zurück gehen!'),
        ),
      ),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  static Route<dynamic> route() {
    return CupertinoPageRoute(
      builder: (BuildContext context) {
        return RegistrationPage();
      },
    );
  }

  // User Registration Page with specific functions Back4App Backend
  const RegistrationPage({Key? key}) : super(key: key);

  // creates a stateful widget Registration page for Back4App backend
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        // appBar: AppBar(
        //   title: const Text('Benutzerregistrierung'),
        // ),
        child: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              child: Image.asset('assets/images/logo.png'),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: const Text('Benutzerregistrierung',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: controllerUsername,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.none,
              autocorrect: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: 'Benutzername'),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: controllerEmail,
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              autocorrect: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: 'E-mail'),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: controllerPassword,
              obscureText: true,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.none,
              autocorrect: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: 'Passwort'),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 50,
              child: TextButton(
                child: const Text('Registrieren'),
                onPressed: () => doUserRegistration(),
              ),
            )
          ],
        ),
      ),
    ));
  }

  void showSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: const Text("User was successfully created!"),
          actions: <Widget>[
            new FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            new FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void doUserRegistration() async {
    final username = controllerUsername.text.trim();
    final email = controllerEmail.text.trim();
    final password = controllerPassword.text.trim();

    final user = ParseUser.createUser(username, password, email);

    var response = await user.signUp();

    if (response.success) {
      showSuccess();
    } else {
      showError(response.error!.message);
    }
  }
}

// class UserLoginPage extends StatefulWidget {
//   // User Login Page with the specific Back4App functions
//   const UserLoginPage({Key? key}) : super(key: key);

//   @override
//   _UserLoginPageState createState() => _UserLoginPageState();
// }

// class _UserLoginPageState extends State<UserLoginPage> {
//   final controllerUsername = TextEditingController();
//   final controllerPassword = TextEditingController();
//   bool isLoggedIn = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Benutzer Login/Logout'),
//         ),
//         body: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Container(
//                   height: 200,
//                   child: Image.asset('assets/images/logo.png'),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Center(
//                   child: const Text('Benutzer Login/Logout',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 TextField(
//                   controller: controllerUsername,
//                   enabled: !isLoggedIn,
//                   keyboardType: TextInputType.text,
//                   textCapitalization: TextCapitalization.none,
//                   autocorrect: false,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black)),
//                       labelText: 'Benutzername'),
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 TextField(
//                   controller: controllerPassword,
//                   enabled: !isLoggedIn,
//                   obscureText: true,
//                   keyboardType: TextInputType.text,
//                   textCapitalization: TextCapitalization.none,
//                   autocorrect: false,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black)),
//                       labelText: 'Passwort'),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Container(
//                   height: 50,
//                   child: TextButton(
//                     child: const Text('Einloggen'),
//                     onPressed: isLoggedIn ? null : () => doUserLogin(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Container(
//                   height: 50,
//                   child: TextButton(
//                     child: const Text('Ausloggen'),
//                     onPressed: !isLoggedIn ? null : () => doUserLogout(),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }

//   void showSuccess(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text("Success!"),
//           content: Text(message),
//           actions: <Widget>[
//             new TextButton(
//               child: const Text("OK"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void showError(String errorMessage) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text("Error!"),
//           content: Text(errorMessage),
//           actions: <Widget>[
//             new TextButton(
//               child: const Text("OK"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void doUserLogin() async {
//     final username = controllerUsername.text.trim();
//     final password = controllerPassword.text.trim();

//     final user = ParseUser(username, password, null);

//     var response = await user.login();

//     if (response.success) {
//       showSuccess("User was successfully login!");
//       setState(() {
//         isLoggedIn = true;
//       });
//     } else {
//       showError(response.error!.message);
//     }
//   }

//   void doUserLogout() async {
//     final user = await ParseUser.currentUser() as ParseUser;
//     var response = await user.logout();

//     if (response.success) {
//       showSuccess("User was successfully logout!");
//       setState(() {
//         isLoggedIn = false;
//       });
//     } else {
//       showError(response.error!.message);
//     }
//   }
// }
