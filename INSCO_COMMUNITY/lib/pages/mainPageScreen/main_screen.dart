import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/pages/homepage.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, CustomPageRoute(widget: SettingsPage()));
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.settings),
              ),
            ),
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
                if (currentUser.title != 'User')
                  NavigationButtons(
                    widScreen: DiscussionScreen(),
                    icon: Icon(
                      Icons.chat_bubble,
                      color: Colors.white,
                    ),
                  )
                else
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showFlushBar(context, title: 'Alert!!!', message: 'Cannot access to chat');
                      });
                    },
                    child: Material(
                      elevation: 5.0,
                      color: Colour.buttonColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 25.0),
                        child: Center(
                          child: Icon(
                            Icons.chat_bubble,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
