import 'package:INSCO_COMMUNITY/modal/account.dart';
import 'package:INSCO_COMMUNITY/pages/authentication/authStore/local_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

final userRef = FirebaseFirestore.instance.collection("accounts");


Account currentUser;

getUserData() async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot doc = await userRef.doc(user.uid).get();
    if (user != null) {
      currentUser = Account.fromJson(doc.data());
      // print(user.uid);
      // print(currentUser);
      // print(currentUser.batch);
    }
  } catch (e) {
    // print(e);
  }
}

void showFlushBar(BuildContext context, {String title, String message}) =>
    Flushbar(
      title: title,
      message: message,
      icon: Icon(Icons.info_outline_rounded),
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: 16,
      barBlur: 20,
      backgroundColor: Colors.black.withOpacity(0.5),
      padding: EdgeInsets.all(10.0),
    )..show(context);

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
