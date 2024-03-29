import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/modal/account.dart';
import 'package:INSCO_COMMUNITY/pages/homepage.dart';
import 'package:INSCO_COMMUNITY/pages/profile/profile_image.dart';
import 'package:INSCO_COMMUNITY/pages/profile/profile_shimmer.dart';
import 'package:INSCO_COMMUNITY/widget/page_route_transition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileToOther extends StatefulWidget {
  final String userId;

  const ProfileToOther({Key key, @required this.userId}) : super(key: key);

  @override
  _ProfileToOtherState createState() => _ProfileToOtherState();
}

class _ProfileToOtherState extends State<ProfileToOther> {
  void launchWhatsapp({@required number, @required message}) async {
    String url = "whatsapp://send?phone=$number&text=$message";
    try {
      await canLaunch(url);
      launch(url);
    } catch (e) {
      setState(() {
        showFlushBar(context, message: e.message);
      });
    }
  }

  profileBody() {
    return FutureBuilder(
        future: userRef.doc(widget.userId).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return ProfileShimmer();
          }
          Account memberData = Account.fromJson(snapshot.data.data());
          return Scaffold(
            backgroundColor: Colour.primaryColor,
            appBar: AppBar(
              title: Text('${memberData.username}'),
              automaticallyImplyLeading: true,
              backgroundColor: Colour.buttonColor,
            ),
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Hero(
                            tag: '${memberData.username}',
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CustomPageRoute(
                                    widget: ProfileImage(
                                      username: memberData.username,
                                      imageUrl: memberData.photoUrl == ''
                                          ? './assets/images/avtar.png'
                                          : memberData.photoUrl,
                                    ),
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                  radius: 70.0,
                                  backgroundColor: Colour.greyLight,
                                  backgroundImage: memberData.photoUrl == ''
                                      ? AssetImage('./assets/images/avtar.png')
                                      : CachedNetworkImageProvider(
                                          memberData.photoUrl)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Center(
                        child: Text(
                          memberData.username,
                          style: GoogleFonts.lato(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      memberData.showEmail
                          ? Center(
                              child: Text(
                                memberData.email,
                                style: GoogleFonts.lato(
                                    fontSize: 13,
                                    color: Colour.buttonColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : Text(''),
                      SizedBox(
                        height: 35.0,
                      ),
                      Text(
                        "About",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: memberData.bio == ''
                              ? Text(
                                  'Write about yourself',
                                  style: GoogleFonts.lato(
                                      fontSize: 13, color: Colour.lineColor),
                                )
                              : Container(
                                  width: double.infinity,
                                  child: Material(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    color: Colour.greyLight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        memberData.bio,
                                        style: GoogleFonts.lato(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(
                        height: memberData.batch != null ? 20.0 : 0,
                      ),
                      memberData.batch != null
                          ? Row(
                              children: [
                                Text(
                                  'Batch',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Text(
                                    memberData.batch.toString(),
                                    style: GoogleFonts.lato(fontSize: 15),
                                  ),
                                ),
                              ],
                            )
                          : Text(''),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        memberData.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(child: Icon(Icons.work, size: 16)),
                          ),
                          Text(
                            'Work at',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: memberData.workPlace == ''
                            ? Text(
                                'Not Updated',
                                style: GoogleFonts.lato(
                                    fontSize: 13, color: Colour.lineColor),
                              )
                            : Container(
                                width: double.infinity,
                                child: Material(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Colour.greyLight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      memberData.workPlace,
                                      style: GoogleFonts.lato(fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      memberData.showMobileNumber
                          ? GestureDetector(
                              onTap: () {
                                launchWhatsapp(
                                  number: "+91${memberData.mobileNumber}",
                                  message:
                                      'Hi,\nI am ${currentUser.username}\nfrom INSCO COMMUNITY\n\n',
                                );
                              },
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Material(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                    color: Colour.greyLight,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 15.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Contact me on',
                                              style: GoogleFonts.lato(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                              height: 40.0,
                                              width: 40.0,
                                              child: Image.asset(
                                                  "./assets/images/whatsapp.png")),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Text(''),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: profileBody(),
      ),
    );
  }
}
