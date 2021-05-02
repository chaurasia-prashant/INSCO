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
      body: Wrap(
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
    );
  }
}
