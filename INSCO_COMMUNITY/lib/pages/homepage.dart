import 'package:INSCO_COMMUNITY/modal/account.dart';
import 'package:INSCO_COMMUNITY/pages/authentication/authStore/local_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';


final userRef = FirebaseFirestore.instance.collection("accounts");
Account currentUser;


  void getUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      DocumentSnapshot doc = await userRef.doc(user.uid).get();
      if (user != null) {
        currentUser = Account.fromJson(doc.data());
        print(user.uid);
        print(currentUser);
        print(currentUser.batch);
      }
    } catch (e) {
      print(e);
    }
  }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocalStorage localStorage = LocalStorage();

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  // getUserData() async {
  //   if (localStorage.prefs == null) {
       // localStorage.init();
  //     currentUser.username = localStorage.prefs.getString('username');
  //     currentUser.email = localStorage.prefs.getString('email');
  //     currentUser.photoUrl = localStorage.prefs.getString('photoUrl');
  //     currentUser.title = localStorage.prefs.getString('title');
  //     currentUser.bio = localStorage.prefs.getString('bio');
  //     currentUser.batch = localStorage.prefs.getInt('batch');
  //     currentUser.mobileNumber = localStorage.prefs.getString('mobileNumber');
  //   }
  // }


  // void getUserData() async {
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



  @override
  Widget build(BuildContext context) {
    return MainScreen();
  }

}
