import 'package:INSCO_COMMUNITY/helper/authentication.dart';
import 'package:INSCO_COMMUNITY/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
