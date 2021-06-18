import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/buttons/main_page_button.dart';
import 'package:INSCO_COMMUNITY/pages/profile/profile.dart';
import 'package:INSCO_COMMUNITY/pages/search/search.dart';
import 'package:INSCO_COMMUNITY/pages/creators.dart';
import 'package:INSCO_COMMUNITY/pages/gallery/gallery.dart';
import 'package:INSCO_COMMUNITY/pages/history.dart';
import 'package:INSCO_COMMUNITY/pages/members/members.dart';
import 'package:INSCO_COMMUNITY/pages/settings/settings.dart';
import 'package:INSCO_COMMUNITY/pages/studyPages/notes.dart';
import 'package:INSCO_COMMUNITY/pages/studyPages/syllabus.dart';
import 'package:INSCO_COMMUNITY/pages/chat/discussion.dart';
import 'package:INSCO_COMMUNITY/widget/page_route_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final user = FirebaseAuth.instance.currentUser;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    // currentUserData();
  }

  // Future<QuerySnapshot> _userData;

  // currentUserData() {
  //   Future<QuerySnapshot> currentuser =
  //       userRef.where('id', isEqualTo: user.uid).get();
  //   setState(() {
  //     _userData = currentuser;
  //   });
  // }

  // Drawer _customDrawer() => Drawer(
  //         child: ListView(children: <Widget>[
  //       DrawerHeader(
  //         decoration: BoxDecoration(color: Colour.greyLight),
  //         child: FutureBuilder(
  //             future: userRef.doc(user.uid).get(),
  //             builder: (context, snapshot) {
  //               if (!snapshot.hasData) {
  //                 return DrawerShimmer();
  //               }
  //               Account userData = Account.fromJson(snapshot.data.data());
  //               return Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: <Widget>[
  //                   CircleAvatar(
  //                     backgroundColor: Colors.transparent,
  //                     backgroundImage: userData.photoUrl == ''
  //                         ? AssetImage('./assets/images/avtar.png')
  //                         : CachedNetworkImageProvider(userData.photoUrl),
  //                     radius: 40.0,
  //                   ),
  //                   Expanded(
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(8.0),
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: <Widget>[
  //                           Text(
  //                             userData.username,
  //                             style: TextStyle(
  //                                 fontWeight: FontWeight.bold, fontSize: 25.0),
  //                           ),
  //                           SizedBox(height: 10.0),
  //                           Text(
  //                             userData.email,
  //                             style: TextStyle(
  //                                 fontWeight: FontWeight.bold, fontSize: 14.0),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   )
  //                 ],
  //               );
  //             }),
  //       ),
  //       ListTile(
  //         leading: Icon(Icons.edit_rounded),
  //         title: Text('Edit profile', style: TextStyle(fontSize: 18)),
  //         onTap: () {
  //           // Here you can give your route to navigate
  //           Navigator.of(context).pop();
  //           Navigator.push(context, CustomPageRoute(widget: EditProfile()));
  //         },
  //       ),
  //       ListTile(
  //         leading: Icon(Icons.privacy_tip_rounded),
  //         title: Text('Privacy', style: TextStyle(fontSize: 18)),
  //         onTap: () {
  //           // Here you can give your route to navigate
  //           Navigator.of(context).pop();
  //           Navigator.push(context, CustomPageRoute(widget: Privacy()));
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
  //           Navigator.push(context, CustomPageRoute(widget: WelcomePage()));
  //         },
  //       ),
  //     ]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, CustomPageRoute(widget: Settings()));
            },
            child: Icon(Icons.settings),
          ),
        ],
        title: Center(
          child: Text(
            'INSCO',
            style: TextStyle(
              fontFamily: "Niconne",
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colour.secondaryColor,
      ),
      backgroundColor: Colour.primaryColor,
      // drawer: _customDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 80.0,
                runSpacing: 30.0,
                children: [
                  MainPageButton(
                    imagePath: "./assets/images/history.png",
                    buttonName: "History",
                    widScreen: HistoryPage(),
                  ),
                  MainPageButton(
                    imagePath: "./assets/images/members.png",
                    buttonName: "Members",
                    widScreen: MembersPage(),
                  ),
                  MainPageButton(
                    imagePath: "./assets/images/gallery.png",
                    buttonName: "Gallery",
                    widScreen: GalleryPage(),
                  ),
                  MainPageButton(
                    imagePath: "./assets/images/syllabus.png",
                    buttonName: "Syllabus",
                    widScreen: SyllabusPage(),
                  ),
                  MainPageButton(
                    imagePath: "./assets/images/notes.png",
                    buttonName: "Notes",
                    widScreen: NotesPage(),
                  ),
                  MainPageButton(
                    imagePath: "./assets/images/creator.png",
                    buttonName: "Creators",
                    widScreen: CreatorPage(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Container(height: 2.0, color: Colour.lineColor),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 15.0, left: 30.0, right: 30.0, bottom: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigationButtons(
                  widScreen: DiscussionScreen(),
                  icon: Icon(
                    Icons.chat_bubble,
                    color: Colors.white,
                  ),
                ),
                NavigationButtons(
                  widScreen: SearchScreen(),
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                NavigationButtons(
                  widScreen: ProfileScreen(),
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationButtons extends StatelessWidget {
  final Icon icon;
  final Widget widScreen;
  const NavigationButtons({
    @required this.widScreen,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, CustomPageRoute(widget: widScreen));
      },
      child: Material(
        elevation: 5.0,
        color: Colour.buttonColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
          child: Center(child: icon),
        ),
      ),
    );
  }
}
