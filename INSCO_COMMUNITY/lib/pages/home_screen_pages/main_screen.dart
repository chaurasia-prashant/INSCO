import 'package:INSCO_COMMUNITY/component/color.dart';
import 'package:INSCO_COMMUNITY/component/main_page_button.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/creators.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/gallery.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/history.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/members.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/notes.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/syllabus.dart';
import 'package:INSCO_COMMUNITY/pages/home_screen_pages/discussion.dart';
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
            'Insco',
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DiscussionScreen()));
                },
                child: Icon(Icons.chat)),
          )
        ],

        // actions: [
        //   Container(
        //     child: GestureDetector(
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
        //               MaterialPageRoute(builder: (context) => WelcomePage()));
        //         },
        //         child: Icon(Icons.logout)),
        //   )
        // ],
        backgroundColor: Colour.bgColor,
      ),
      backgroundColor: Colour.bgColor,
      body: Column(
        children: [
          Divider(
            thickness: 1.0,
            color: Colors.white,
          ),
          Expanded(
            child: Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 70.0,
                runSpacing: 40.0,
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
        ],
      ),
    );
  }
}
