import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../homepage.dart';

class Privacy extends StatefulWidget {
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = false;
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

  void updatePrivicy() async {
    try {
      FirebaseFirestore.instance
          .collection('accounts')
          .doc(currentUser.id)
          .update({
            'showEmail': _showEmail,
            'showMobileNumber' : _showMobileNumber,
          }).whenComplete(() async {
        _scaffoldKey.currentState.showSnackBar(
            snackbar(snackText: "Privacy Updated!"));
        await Future.delayed(const Duration(seconds: 1));
        getUserData();
        Navigator.pop(context);
      });
    } catch (e) {
      _scaffoldKey.currentState
          .showSnackBar(snackbar(snackText: "Something went Wrong!"));
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
      key: _scaffoldKey,
      backgroundColor: Colour.primaryColor,
      appBar: AppBar(
        title: Center(child: Text("Privacy Update")),
        automaticallyImplyLeading: true,
        backgroundColor: Colour.buttonColor,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.done),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                        radius: 70.0,
                        backgroundColor: Colour.primaryColor,
                        backgroundImage: currentUser.photoUrl != ''
                            ? CachedNetworkImage(
                                imageUrl: currentUser.photoUrl,
                              )
                            : AssetImage("./assets/images/avtar.png")),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Center(
                  child: Text(
                    currentUser.username,
                    style: GoogleFonts.lato(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    currentUser.email,
                    style: GoogleFonts.lato(
                        fontSize: 13,
                        color: Colour.buttonColor,
                        fontWeight: FontWeight.bold),
                  ),
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
                          'Show Email',
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colour.tertioryColor),
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
                              color: Colour.tertioryColor),
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
