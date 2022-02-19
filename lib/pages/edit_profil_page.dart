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
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'E-Mail',
              text: user.email,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Beschreibung',
              text: user.about,
              maxLines: 5,
              onChanged: (about) {},
            ),
          ],
        ),
      );
}
