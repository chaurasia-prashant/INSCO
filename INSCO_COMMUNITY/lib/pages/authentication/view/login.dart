import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/pages/accountSettings/reset_password.dart';
import 'package:INSCO_COMMUNITY/widget/flatbutton.dart';
import 'package:INSCO_COMMUNITY/widget/font_text.dart';
import 'package:INSCO_COMMUNITY/widget/text_field.dart';
import 'package:INSCO_COMMUNITY/pages/authentication/firebase_auth/authentication.dart';
import 'package:INSCO_COMMUNITY/pages/authentication/authStore/local_storage.dart';
import 'package:INSCO_COMMUNITY/helper/screen_size.dart';
import 'package:INSCO_COMMUNITY/helper/validators.dart';
import 'package:INSCO_COMMUNITY/modal/account.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../homepage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String password;
  String email;



  @override
  Widget build(BuildContext context) {
    Screen screen = Screen(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
        child: Form(
          key: formKey,
          child: Scaffold(
            // backgroundColor: Colors.transparent,
            // resizeToAvoidBottomInset: false,
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(screen.horizontal(4)),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                          height: screen.vertical(110),
                        ),
                        LatoText(
                          'Welcome\nBack',
                          size: 48,
                        ),
                        SizedBox(
                          height: screen.vertical(25),
                        ),
                        RailwayText(
                          'Enter credentials to login\nin INSCO community.',
                          fontColor: Colour.tertioryColor,
                          size: 18,
                        ),
                        SizedBox(
                          height: screen.vertical(45),
                        ),
                        CustomTextField(
                          hintText: 'Email',
                          validator: emailValidator,
                          onChanged: (value) {
                            email = value;
                          },
                          textAlignment: TextAlign.start,
                          keyboard: TextInputType.emailAddress,
                          preffixWidget: Icon(
                            Icons.email_outlined,
                            color: Colour.lineColor,
                          ),
                        ),
                        SizedBox(
                          height: screen.vertical(25),
                        ),
                        CustomTextField(
                          hintText: 'Password',
                          validator: passwordValidator,
                          onChanged: (value) {
                            password = value;
                            // print(password);
                          },
                          textAlignment: TextAlign.start,
                          hideText: true,
                          preffixWidget: Icon(
                            Icons.vpn_key_outlined,
                            color: Colour.lineColor,
                          ),
                        ),
                        SizedBox(
                          height: screen.vertical(25),
                        ),
                        Button(
                          'Login',
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              try {
                                  Authentication authentication =
                                    Authentication();
                                    
                                  final user = await authentication.loginUser(
                                    email, password);
                                  if (user != null) {
                                  final userid =
                                      FirebaseAuth.instance.currentUser.uid;
                                  final data = await FirebaseFirestore.instance
                                      .collection('accounts')
                                      .doc(userid)
                                      .get();
                                  // print(data.data());
                                  Account account =
                                      Account.fromJson(data.data());
                                  LocalStorage localStorage = LocalStorage();
                                  if (localStorage.prefs == null) {
                                    localStorage.init();
                                  }
                                  await localStorage.setAccount(account);
                                  Navigator.pushAndRemoveUntil<dynamic>(
                                    context,
                                    MaterialPageRoute<dynamic>(
                                      builder: (BuildContext context) =>
                                          HomePage(),
                                    ),
                                    (route) =>
                                        false, //if you want to disable back feature set to false
                                  );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                  // debugPrint('Login');
                                }
                              } catch (e) {
                                
                                setState(() {
                                  showFlushBar(context,title: 'Login Alert!', message: e.message);
                                });
                              }
                            }
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResetPassword()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right:10.0, top:15.0),
                            child: Container(
                              child: Text(
                                'Forget passwor?',
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screen.vertical(30),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RailwayText(
                            'New to INSCO ?',
                            size: 14,
                          ),
                        ),
                        SizedBox(
                          height: screen.vertical(2),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RailwayText(
                              'SIGN UP',
                              size: 14,
                              weight: FontWeight.bold,
                              fontColor: Colour.buttonColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }
}
