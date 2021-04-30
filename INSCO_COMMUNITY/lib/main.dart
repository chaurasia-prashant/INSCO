import 'package:INSCO_COMMUNITY/helper/local_storage.dart';
import 'package:INSCO_COMMUNITY/pages/authentication/authenicate_page.dart';

import 'package:INSCO_COMMUNITY/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(InscoApp());
}

class InscoApp extends StatefulWidget {
  @override
  _InscoAppState createState() => _InscoAppState();
}

class _InscoAppState extends State<InscoApp> {
  String value;
  bool showSplashScreen = true;
  bool loadHomeScreen = false;
  LocalStorage localStorage = LocalStorage();

  //This function shows splash screen until all backend loading
  initiationFirebase() async {
    await Firebase.initializeApp();
    if (localStorage.prefs == null) {
      await localStorage.init();
    }
    value = localStorage.prefs.getString('key');
    // value = "suyash";
    if (value == null) {
      setState(() {
        loadHomeScreen = false;
      });
    } else if (value != null) {
      loadHomeScreen = true;
    }
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      showSplashScreen = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initiationFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: showSplashScreen == true
          ? SplashScreen()
          : AuthenticatePage(
              loadHome: loadHomeScreen,
            ),
    );
  }
  //TODO implement future for splash screen using ternary

}
