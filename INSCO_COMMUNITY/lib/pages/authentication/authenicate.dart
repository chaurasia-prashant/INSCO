import 'package:INSCO_COMMUNITY/helper/screen_size.dart';
import 'package:flutter/material.dart';

class AuthenticatePage extends StatefulWidget {
  @override
  _AuthenticatePageState createState() => _AuthenticatePageState();
}

class _AuthenticatePageState extends State<AuthenticatePage> {
  @override
  Widget build(BuildContext context) {
    Screen screen = Screen(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            './assets/images/authenticate_bg.png',
            height: screen.vertical(1000),
            width: screen.horizontal(100),
            fit: BoxFit.fill,
          ),
          ListView(
            children: [
              SizedBox(
                height: screen.vertical(100),
              ),
            ],
          )
        ],
      ),
    );
  }
}
