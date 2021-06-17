/*

This is welcome page running for show welcome screen to user who open apps for the first
time.

*/

import 'package:INSCO_COMMUNITY/pages/authentication/view/login.dart';
import 'package:INSCO_COMMUNITY/pages/authentication/view/registration.dart';
import 'package:INSCO_COMMUNITY/widget/flatbutton.dart';
import 'package:INSCO_COMMUNITY/widget/font_text.dart';
import 'package:INSCO_COMMUNITY/widget/page_route_transition.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RailwayText('Welcome To', size: 40.0, weight: FontWeight.bold,),
            SizedBox(height: 50.0,),
            RailwayText('INSCO COMMUNITY', size: 20.0, weight: FontWeight.bold,),
            SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Button(
                'Login',
                onPressed: () {
                  Navigator.push(context, CustomPageRoute(widget: LoginScreen()));
                },),
            ),
              SizedBox(height: 15.0,),
              RailwayText('OR', size: 10.0, weight: FontWeight.bold,),
            SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Button(
                'Sign Up',
                onPressed: () {
                  Navigator.push(context, CustomPageRoute(widget: RegistrationScreen()));
                },),
              ),
            
          ],
        ),
      ),
    );
  }
}
