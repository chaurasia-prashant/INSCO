import 'package:INSCO_COMMUNITY/component/color.dart';
import 'package:INSCO_COMMUNITY/component/main_page_button.dart';
import 'package:INSCO_COMMUNITY/pages/home_screen_pages/profile.dart';
import 'package:INSCO_COMMUNITY/pages/home_screen_pages/search.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/creators.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/gallery.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/history.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/members.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/notes.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/syllabus.dart';
import 'package:INSCO_COMMUNITY/pages/home_screen_pages/discussion.dart';
import 'package:INSCO_COMMUNITY/helper/authentication.dart';
import 'package:INSCO_COMMUNITY/pages/welcome_page.dart';
import 'package:flutter/material.dart';

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
        actions: [
          Container(
            child: GestureDetector(
                onTap: () async {
                  Authentication authentication = Authentication();
                  await authentication.logoutUser();
                  Navigator.pushAndRemoveUntil<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => WelcomePage(),
                    ),
                    (route) =>
                        false, //if you want to disable back feature set to false
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomePage()));
                },
                child: Icon(Icons.logout)),
          ),
        ],
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widScreen));
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
