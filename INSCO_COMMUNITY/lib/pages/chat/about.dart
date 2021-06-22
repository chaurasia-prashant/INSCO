import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../homepage.dart';

class AboutDiscussion extends StatefulWidget {
  @override
  _AboutDiscussionState createState() => _AboutDiscussionState();
}

class _AboutDiscussionState extends State<AboutDiscussion> {
  void launchWhatsapp({@required whatshappUrl}) async {
    String url = whatshappUrl;
    try {
      await canLaunch(url);
      launch(url);
    } catch (e) {
      setState(() {
        showFlushBar(context, message: e.message);
      });
    }
  }

  String title = 'Insco Community Discussion';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                backgroundColor: Colour.buttonColor,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(title,
                        style: TextStyle(
                          color: Colour.greyLight,
                          // fontSize: 25.0,
                        )),
                  ),
                  background: Image(
                    image: AssetImage('./assets/images/chat.png'),
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                Center(
                  child: Text(
                    'Hope you all enjoy our community discussion plateform!!!!',
                    style: GoogleFonts.lato(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'Currently we have limited accessibility in this chat section but your support make us do great.',
                  style: GoogleFonts.lato(fontSize: 15.0),
                ),
                SizedBox(height: 20),
                Text(
                  "Don't forget to join our whatshapp community group.",
                  style: GoogleFonts.lato(fontSize: 20.0),
                ),
                SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      launchWhatsapp(whatshappUrl: staticData.whatshappGroupUrl);
                    },
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colour.greyLight,
                      child: Container(
                        width: 200.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Join here',
                                  style: GoogleFonts.lato(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('./assets/images/whatsapp.png'),
                                backgroundColor: Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    ));
  }
}
