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

  bool showLoading = false;
  bool _showEmail;
  bool _showMobileNumber;

  @override
  void initState() {
    super.initState();
    getPreData();
  }

  getPreData() {
    _showEmail = currentUser.showEmail;
    _showMobileNumber = currentUser.showMobileNumber;
  }

  void updatePrivicy() {
    try {
      FirebaseFirestore.instance
          .collection('accounts')
          .doc(currentUser.id)
          .update({
        'showEmail': _showEmail,
        'showMobileNumber': _showMobileNumber,
      }).whenComplete(() {
        setState(() {
          showLoading = false;
          getUserData();
          showFlushBar(context,
              title: 'Privacy Alert!',
              message: "Your privacy updated successfully!");
        });
      });
    } catch (e) {
      setState(() {
        showLoading = false;
        showFlushBar(context, message: e.message);
      });
    }
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
                  height: 10.0,
                ),
                RailwayText('Update your privacy for email and phone number.', weight: FontWeight.bold,),
                SizedBox(
                  height: 15.0,
                ),
                RailwayText('Updating privacy allow to control visibility of email and phone number to other members'),
                SizedBox(
                  height: 60.0,
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
                  child: showLoading
                      ? Material(
                          elevation: 8,
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0)),
                          color: Colour.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: CircularProgressIndicator(),
                          ))
                      : Material(
                          color: Colour.buttonColor,
                          elevation: 8.0,
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                showLoading = true;
                              });
                              updatePrivicy();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 30.0),
                              child: Text(
                                'Update',
                                style: TextStyle(color: Colour.primaryColor),
                              ),
                            ),
                          ),
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
