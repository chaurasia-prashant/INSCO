import 'package:INSCO_COMMUNITY/component/color.dart';
import 'package:INSCO_COMMUNITY/component/flatbutton.dart';
import 'package:INSCO_COMMUNITY/component/font_text.dart';
import 'package:INSCO_COMMUNITY/component/text_field.dart';
import 'package:INSCO_COMMUNITY/helper/screen_size.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Screen screen = Screen(context);
    return Scaffold(
      backgroundColor: Colour.bgColor,
      // resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(screen.horizontal(4)),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: screen.vertical(150),
              ),
              LatoText(
                'Welcome\nBack',
                size: 48,
              ),
              SizedBox(
                height: screen.vertical(25),
              ),
              RailwayText(
                'Enter your email and password to login\nin INSCO community.',
                fontColor: Colors.grey[400],
                size: 18,
              ),
              SizedBox(
                height: screen.vertical(45),
              ),
              CustomTextField(
                hintText: 'Email',
                textAlignment: TextAlign.start,
                keyboard: TextInputType.emailAddress,
                preffixWidget: Icon(
                  Icons.email_outlined,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: screen.vertical(25),
              ),
              CustomTextField(
                hintText: 'Password',
                textAlignment: TextAlign.start,
                hideText: true,
                preffixWidget: Icon(
                  Icons.vpn_key_outlined,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: screen.vertical(25),
              ),
              Button(
                'Login',
                onPressed: () {
                  debugPrint('Login');
                },
              ),
              SizedBox(
                height: screen.vertical(70),
              ),
              RailwayText(
                'New to INSCO ?',
                fontColor: Colors.grey[400],
                size: 14,
              ),
              SizedBox(
                height: screen.vertical(10),
              ),
              GestureDetector(
                onTap: () {
                  debugPrint('Sign up');
                },
                child: RailwayText(
                  'SIGN UP',
                  fontColor: Colors.white,
                  size: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
