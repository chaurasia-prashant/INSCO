// import 'package:INSCO_COMMUNITY/component/color.dart';
import 'package:INSCO_COMMUNITY/modal/account.dart';
import 'package:INSCO_COMMUNITY/pages/authentication/authStore/local_storage.dart';
// import 'package:INSCO_COMMUNITY/pages/home_screen_pages/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/main_screen.dart';
// import 'package:INSCO_COMMUNITY/pages/home_screen_pages/profile.dart';
// import 'package:INSCO_COMMUNITY/pages/home_screen_pages/search.dart';

final userRef = FirebaseFirestore.instance.collection("accounts");
Account currentUser;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocalStorage localStorage = LocalStorage();

  @override
  void initState() {
    super.initState();
    // pageController = PageController();
    getUserData();
  }

  getUserData() async {
    if (localStorage.prefs == null) {
      await localStorage.init();
      currentUser.username = localStorage.prefs.getString('username');
      currentUser.email = localStorage.prefs.getString('email');
      currentUser.photoUrl = localStorage.prefs.getString('photoUrl');
      currentUser.title = localStorage.prefs.getString('title');
      currentUser.bio = localStorage.prefs.getString('bio');
      currentUser.batch = localStorage.prefs.getInt('batch');
      currentUser.mobileNumber = localStorage.prefs.getString('mobileNumber');
    }
  }

  @override
  void dispose() {
    // pageController.dispose();
    super.dispose();
  }

  // void getUser() async {
  //   try {
  //     final user = FirebaseAuth.instance.currentUser;
  //     DocumentSnapshot doc = await userRef.doc(user.uid).get();
  //     if (user != null) {
  //       currentUser = Account.fromJson(doc.data());
  //       print(user.uid);
  //       print(currentUser);
  //       print(currentUser.batch);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // onPageChanged(int pageIndex) {
  //   setState(() {
  //     this.pageIndex = pageIndex;
  //   });
  // }

  // onTap(int pageIndex) {
  //   pageController.jumpToPage(
  //     pageIndex,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MainScreen();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     key: _scaffoldKey,
  //     body: PageView(
  //       children: <Widget>[
  //         MainScreen(),
  //         SearchScreen(),
  //         PostScreen(),
  //         ProfileScreen(),
  //       ],
  //       controller: pageController,
  //       onPageChanged: onPageChanged,
  //       physics: NeverScrollableScrollPhysics(),
  //     ),
  //     bottomNavigationBar: BottomNavigationBar(
  //       currentIndex: pageIndex,
  //       onTap: onTap,
  //       backgroundColor: Colour.secondaryColor,
  //       selectedItemColor: Colour.buttonColor,
  //       unselectedItemColor: Colour.lineColor,
  //       showSelectedLabels: true,
  //       showUnselectedLabels: true,
  //       items: <BottomNavigationBarItem>[
  //         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
  //         BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
  //         BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'Post'),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.account_circle), label: 'Profile'),
  //       ],
  //     ),
  //   );
  // }
}
