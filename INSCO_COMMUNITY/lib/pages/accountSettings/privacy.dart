import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/widget/font_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../homepage.dart';

class Privacy extends StatefulWidget {
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  // TextEditingController otpController = TextEditingController();

  bool isLoading = false;
  bool _showEmail;
  bool _showMobileNumber;
  bool phoneVerifyButtonPressed = false;
  String otp;
  String verificationCode;

  @override
  void initState() {
    super.initState();
    getPreData();
  }


  getPreData() {
    _showEmail = currentUser.showEmail;
    _showMobileNumber = currentUser.showMobileNumber;
  }

  void updatePrivicy() async {
    try {
      FirebaseFirestore.instance
          .collection('accounts')
          .doc(currentUser.id)
          .update({
        'showEmail': _showEmail,
        'showMobileNumber': _showMobileNumber,
      }).whenComplete(() async {
        setState(() {
          showFlushBar(context, title: 'Privacy Alert!',
              message: "Your privacy updated successfully!");
        });
      });
    } catch (e) {
      setState(() {
        showFlushBar(context, message: e.message);
      });
    }
  }

  SnackBar snackbar({String snackText}) {
    return SnackBar(
      content: Text(snackText),
      backgroundColor: Colors.purple[300],
      behavior: SnackBarBehavior.floating,
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.primaryColor,
      appBar: AppBar(
        title: Center(child: Text("Privacy Update")),
        automaticallyImplyLeading: true,
        backgroundColor: Colour.buttonColor,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 40.0,
                ),              
                RailwayText('Update your privacy for email and phone number.'),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Show Email',
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colour.buttonColor),
                        ),
                      ),
                    ),
                    Switch(
                      value: _showEmail,
                      onChanged: (value) {
                        setState(() {
                          _showEmail = value;
                        });
                      },
                      inactiveTrackColor: Colour.lineColor,
                      activeTrackColor: Colour.buttonLight,
                      activeColor: Colour.buttonColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Show whatshapp contact',
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colour.buttonColor),
                        ),
                      ),
                    ),
                    Switch(
                      value: _showMobileNumber,
                      onChanged: (value) {
                        setState(() {
                          _showMobileNumber = value;
                        });
                      },
                      inactiveTrackColor: Colour.lineColor,
                      activeTrackColor: Colour.buttonLight,
                      activeColor: Colour.buttonColor,
                    ),
                  ],
                ),
                SizedBox(height: 80.0),
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      updatePrivicy();
                    },
                    child: Text('Update'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
