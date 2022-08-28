import 'package:divily/pages/profilpage.dart';
import 'package:divily/utils/user_preferences.dart';
import 'package:flutter/material.dart';

import '../model/user.dart'; // imports material package for material app class
import 'package:divily/configuration.dart';
import 'package:divily/pages/widgets/profile_widget.dart';
import 'package:divily/pages/widgets/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Profilseite'),
          backgroundColor: middleGreen,
        ),
        body: ListView(
          padding: const EdgeInsets.all(24), // add edges looks better
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileWidget(
                imagePath: user.imagePath,
                isEdit: true,
                onClicked: () async {}),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Vollständiger Name',
              text: user.name,
              onChanged: (name) => user = user.copy(name: name),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'E-Mail',
              text: user.email,
              onChanged: (email) => user = user.copy(email: email),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Beschreibung',
              text: user.about,
              maxLines: 5,
              onChanged: (about) => user = user.copy(about: about),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 50,
              child: (ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(darkGrey)),
                child: const Text('Speichern'),
                onPressed: () {
                  UserPreferences.setUser(user);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilPage()),
                    (Route<dynamic> route) => false,
                  );
                },
              )),
            ),
          ],
        ),
      );
}
