import 'package:INSCO_COMMUNITY/helper/authentication.dart';
import 'package:INSCO_COMMUNITY/helper/local_storage.dart';
import 'package:INSCO_COMMUNITY/modal/account.dart';

import 'package:INSCO_COMMUNITY/pages/welcome_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
          onTap: () async {
            Authentication authentication = Authentication();
            await authentication.logoutUser();
            Navigator.pushAndRemoveUntil<dynamic>(
              context,
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => WelcomePage(),
              ),
              (route) =>
                  false, //if you want to disable back feature set to false
            );
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WelcomePage()));
          },
          child: Text('Home Page')),
    );
  }
}
