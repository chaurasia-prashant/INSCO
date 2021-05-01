/*

this page handles authentication if user is authenticated it is send to homepage else 
send to welcome page

*/

import 'package:INSCO_COMMUNITY/pages/homepage.dart';
import 'package:INSCO_COMMUNITY/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class AuthenticatePage extends StatefulWidget {
  final bool loadHome;
  AuthenticatePage({@required this.loadHome});

  @override
  _AuthenticatePageState createState() => _AuthenticatePageState();
}

class _AuthenticatePageState extends State<AuthenticatePage> {
  @override
  Widget build(BuildContext context) {
    return widget.loadHome == true ? HomePage() : WelcomePage();
  }
}
