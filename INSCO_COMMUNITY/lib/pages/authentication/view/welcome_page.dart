/*

This is welcome page running for show welcome screen to user who open apps for the first
time.

*/

import 'package:INSCO_COMMUNITY/pages/authentication/view/login.dart';
import 'package:INSCO_COMMUNITY/pages/authentication/view/registration.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FlatButton(
              color: Colors.blue,
              child: Text('Login'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            FlatButton(
              color: Colors.green,
              child: Text('Sign Up'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
