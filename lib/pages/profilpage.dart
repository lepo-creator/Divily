import 'package:divily/utils/user_preferences.dart';
import 'package:flutter/material.dart'; // imports material package for material app class
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart'; // imports Parse Server lib for Back4App

//own imports
import 'package:divily/configuration.dart';
import './page2.dart';
import './widgets/profile_widget.dart';
import 'package:divily/model/user.dart';
import './widgets/numbers_widget.dart';
import 'package:divily/pages/edit_profil_page.dart';

class ProfilPage extends StatefulWidget {
  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  ParseUser? currentUser;
  final user = UserPreferences.getUser(); // user pref added

  Future<ParseUser?> getUser() async {
    currentUser = await ParseUser.currentUser() as ParseUser?;
    return currentUser;
  }

  late final Future<ParseUser?>? myFuture2; //defines dynamic future variable
  @override
  void initState() {
    super.initState();
    myFuture2 =
        getUser(); //defines futurevariable in initState ->not effected by rebuild see https://stackoverflow.com/questions/57793479/flutter-futurebuilder-gets-constantly-called
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
        title: const Text('Profilseite'),
        backgroundColor: middleGreen,
      ),
      body: FutureBuilder<ParseUser?>(
        future: myFuture2,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator()),
              );
            default:
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment:
                      MainAxisAlignment.start, // MainAxisAlignment.center
                  children: [
                    ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        ProfileWidget(
                          imagePath: user.imagePath,
                          onClicked: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfilePage()));
                            setState(() {}); //Rebuilds page
                          },
                        ),
                        const SizedBox(height: 24),
                        buildName(user),
                        const SizedBox(height: 24),
                        const NumbersWidget(),
                        const SizedBox(height: 48),
                        buildAbout(user),
                      ],
                    ),
                    Center(child: Text('Hallo, ${snapshot.data!.username}')),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(darkGrey)),
                        child: const Text('Ausloggen'),
                        onPressed: () => doUserLogout(),
                      ),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );
  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Beschreibung",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
