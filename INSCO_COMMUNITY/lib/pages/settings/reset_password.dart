import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/helper/screen_size.dart';
import 'package:INSCO_COMMUNITY/helper/validators.dart';
import 'package:INSCO_COMMUNITY/widget/flatbutton.dart';
import 'package:INSCO_COMMUNITY/widget/font_text.dart';
import 'package:INSCO_COMMUNITY/widget/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formKey = GlobalKey<FormState>();
  String email;

  void showFlushBar(BuildContext context, {String errorText}) => Flushbar(
        title: 'Reset Alert!',
        message: errorText,
        icon: Icon(Icons.info_outline_rounded),
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: 16,
        barBlur: 20,
        backgroundColor: Colors.black.withOpacity(0.5),
        padding: EdgeInsets.all(10.0),
      )..show(context);

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
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(screen.horizontal(4)),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: screen.vertical(60),
                    ),
                    RailwayText(
                      'To reset your password please enter your email id',
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
                    Button('Submit', onPressed: () async {
                      if (formKey.currentState.validate()) {
                        try {
                          await FirebaseAuth.instance
                              .sendPasswordResetEmail(email: email);
                          Navigator.pop(context);
                        } catch (e) {
                          // print("error  caught by appp");
                          setState(() {
                            showFlushBar(context, errorText: e.message);
                          });
                        }
                      }
                    }),
                    SizedBox(
                      height: screen.vertical(70),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RailwayText(
                        'Return to login page ?',
                        size: 14,
                      ),
                    ),
                    SizedBox(
                      height: screen.vertical(2),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RailwayText(
                          'LOGIN',
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
    );
  }
}
