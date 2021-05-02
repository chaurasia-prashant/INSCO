import 'package:INSCO_COMMUNITY/component/color.dart';
import 'package:INSCO_COMMUNITY/component/main_page_button.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/creators.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/gallery.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/history.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/members.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/notes.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/syllabus.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left:10.0, top:5.0,bottom:5.0),
          child: CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: AssetImage("./assets/images/avtar.png"),
          ),
        ),
          title: Center(
            child: Text(
              "username",
              style: TextStyle(
                fontFamily: "Niconne",
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
          ),
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