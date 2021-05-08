import 'package:INSCO_COMMUNITY/helper/local_storage.dart';
import 'package:INSCO_COMMUNITY/pages/authentication/authenicate_page.dart';
import 'package:INSCO_COMMUNITY/pages/authentication/login.dart';

import 'package:INSCO_COMMUNITY/pages/splash_screen.dart';
import 'package:INSCO_COMMUNITY/pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/authentication/registration.dart';

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
    print(value);
  }

  @override
  void initState() {
    super.initState();
    initiationFirebase();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      home: showSplashScreen == true
          ? SplashScreen()
          : AuthenticatePage(
              loadHome: loadHomeScreen,
            ),
      // initialRoute: 'splash_screen',
      // routes: {
      //   'welcome_screen': (context) => WelcomePage(),
      //   'splash_screen': (context) => SplashScreen(),
      //   'login_screen': (context) => LoginScreen(),
      //   'registration_screen': (context) => RegistrationScreen(),
      // }
    );
  }
  //TODO implement future for splash screen using ternary

}
