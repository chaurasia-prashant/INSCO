import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/pages/accountSettings/privacy.dart';
import 'package:INSCO_COMMUNITY/pages/authentication/firebase_auth/authentication.dart';
import 'package:INSCO_COMMUNITY/pages/authentication/view/welcome_page.dart';
import 'package:INSCO_COMMUNITY/pages/profile/edit_profile.dart';
import 'package:INSCO_COMMUNITY/widget/page_route_transition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../homepage.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () async {
        try {
          Authentication authentication = Authentication();
          await authentication.logoutUser();
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => WelcomePage(),
            ),
            (route) => false, //if you want to disable back feature set to false
          );
          Navigator.pop(context);
          Navigator.push(context, CustomPageRoute(widget: WelcomePage()));
        } catch (e) {
          Navigator.pop(context);
          setState(() {
            showFlushBar(context, title: 'Logout Alert!', message: e.message);
          });
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Log out !!!"),
      content: Text("Sure to Log out from the device!!"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.primaryColor,
      appBar: AppBar(
        title: Center(child: Text("Settings")),
        automaticallyImplyLeading: true,
        backgroundColor: Colour.buttonColor,
      ),
      body: Column(children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colour.greyLight),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: currentUser.photoUrl == ''
                      ? AssetImage('./assets/images/avtar.png')
                      : CachedNetworkImageProvider(currentUser.photoUrl),
                  radius: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          currentUser.username,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25.0),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        child: Text(
                          currentUser.email,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.edit_rounded),
          title: Text('Edit profile', style: TextStyle(fontSize: 18)),
          onTap: () {
            Navigator.push(context, CustomPageRoute(widget: EditProfile()));
          },
        ),
        ListTile(
          leading: Icon(Icons.privacy_tip_rounded),
          title: Text('Privacy', style: TextStyle(fontSize: 18)),
          onTap: () {
            Navigator.push(context, CustomPageRoute(widget: Privacy()));
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Log Out', style: TextStyle(fontSize: 18)),
          onTap: () {
            showAlertDialog(context);
          },
        ),
      ]),
    );
  }
}
