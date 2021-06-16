import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/pages/settings/settings.dart';
import 'package:INSCO_COMMUNITY/widget/page_route_transition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../homepage.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  // Drawer _customDrawer() => Drawer(
  //         child: ListView(children: <Widget>[
  //       DrawerHeader(
  //         decoration: BoxDecoration(color: Colour.greyLight),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: <Widget>[
  //             CircleAvatar(
  //               backgroundColor: Colors.transparent,
  //               backgroundImage: currentUser.photoUrl == ''
  //                   ? AssetImage('./assets/images/avtar.png')
  //                   : CachedNetworkImageProvider(currentUser.photoUrl),
  //               radius: 40.0,
  //             ),
  //             Expanded(
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: <Widget>[
  //                   Text(
  //                     currentUser.username,
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.bold, fontSize: 25.0),
  //                   ),
  //                   SizedBox(height: 10.0),
  //                   Text(
  //                     currentUser.email,
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.bold, fontSize: 14.0),
  //                   ),
  //                 ],
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //       ListTile(
  //         leading: Icon(Icons.edit_rounded),
  //         title: Text('Edit profile', style: TextStyle(fontSize: 18)),
  //         onTap: () {
  //           // Here you can give your route to navigate
  //           Navigator.of(context).pop();
  //           Navigator.push(context,
  //               CustomPageRoute(widget: EditProfile()));
  //         },
  //       ),
  //       ListTile(
  //         leading: Icon(Icons.privacy_tip_rounded),
  //         title: Text('Privacy', style: TextStyle(fontSize: 18)),
  //         onTap: () {
  //           // Here you can give your route to navigate
  //           Navigator.of(context).pop();
  //           Navigator.push(
  //               context, CustomPageRoute(widget: Privacy()));
  //         },
  //       ),
  //       ListTile(
  //         leading: Icon(Icons.logout),
  //         title: Text('Log Out', style: TextStyle(fontSize: 18)),
  //         onTap: () async {
  //           Authentication authentication = Authentication();
  //           await authentication.logoutUser();
  //           Navigator.pushAndRemoveUntil<dynamic>(
  //             context,
  //             MaterialPageRoute<dynamic>(
  //               builder: (BuildContext context) => WelcomePage(),
  //             ),
  //             (route) =>
  //                 false, //if you want to disable back feature set to false
  //           );
  //           Navigator.push(context,
  //               CustomPageRoute(widget: WelcomePage()));
  //         },
  //       ),
  //       ListTile(
  //         leading: Icon(Icons.arrow_back),
  //         title: Text('Go back', style: TextStyle(fontSize: 18)),
  //         onTap: () {
  //           // Here you can give your route to navigate
  //           Navigator.of(context).pop();
  //         },
  //       ),
  //     ]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.primaryColor,
      appBar: AppBar(
        title: Center(child: Text("Profile")),
        automaticallyImplyLeading: true,
        backgroundColor: Colour.buttonColor,
        // actions: [
        //   GestureDetector(
        //     onTap: (){
        //       Navigator.push(context,
        //          CustomPageRoute(widget: Settings()));
        //     },
        //     child: Container(
        //       child: Icon(Icons.settings),
        //     ),
        //   ),
        // ],
      ),
      // endDrawer: _customDrawer(),
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
                    child: Hero(
                      tag: 'id-${currentUser.id}',
                      child: CircleAvatar(
                          radius: 70.0,
                          backgroundColor: Colour.primaryColor,
                          backgroundImage: currentUser.photoUrl == ''
                              ? AssetImage('./assets/images/avtar.png')
                              : CachedNetworkImageProvider(
                                  currentUser.photoUrl)),
                    ),
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
                  height: 35.0,
                ),
                Text(
                  "About",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: currentUser.bio == ''
                        ? Text(
                            'Write about yourself',
                            style: GoogleFonts.lato(
                                fontSize: 13, color: Colour.lineColor),
                          )
                        : Text(
                            currentUser.bio,
                            style: GoogleFonts.lato(fontSize: 14),
                          ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text(
                      'Batch',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        currentUser.batch.toString(),
                        style: GoogleFonts.lato(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  currentUser.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
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
                  padding: const EdgeInsets.only(left: 25.0, top: 10.0),
                  child: currentUser.workPlace == ''
                      ? Text(
                          'Not Updated',
                          style: GoogleFonts.lato(fontSize: 15),
                        )
                      : Text(
                          currentUser.workPlace,
                          style: GoogleFonts.lato(fontSize: 15),
                        ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
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
                                    fontSize: 15, fontWeight: FontWeight.bold),
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// CachedNetworkImage(imageUrl: currentUser.photoUrl,
//                             imageBuilder: (context, imageProvider) => Container(
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: imageProvider
//                                 ),
//                               ),
//                             ),
//                             placeholder: (context, url) => CircularProgressIndicator(),
//                             errorWidget: (context, url, error) => Icon(Icons.error),    ),
