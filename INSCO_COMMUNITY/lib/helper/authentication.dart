import 'package:INSCO_COMMUNITY/helper/get_data.dart';
import 'package:INSCO_COMMUNITY/helper/local_storage.dart';
import 'package:INSCO_COMMUNITY/modal/account.dart';
import 'package:INSCO_COMMUNITY/repo/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication extends FirebaseAuthFunctions {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance.collection('accounts');
  UserCredential newUser;
  String uid;
  LocalStorage localStorage = LocalStorage();

  @override
  createUserInFirebase(String email, String password) async {
    try {
      newUser = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      uid = auth.currentUser.uid;
      if (newUser != null) {
        if (localStorage.prefs == null) {
          await localStorage.init();
        }
        localStorage.prefs.setString('key', password);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  saveDataInFirebase(Account account) async {
    await firestore.doc(uid).set(account.toJson());
  }

  @override
  saveDataInLocalStorage(Account account) async {
    await localStorage.setAccount(account);
  }

  @override
  loginUser(String email, String password) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        uid = auth.currentUser.uid;
        if (localStorage.prefs == null) {
          await localStorage.init();
        }
        await localStorage.prefs.setString('key', password);
        print(localStorage.prefs.getString('key'));
        UserDataFromFirebase userDataFromFirebase = UserDataFromFirebase();
        final data = await userDataFromFirebase.getUserData(uid, "accounts");
        final account = Account.fromJson(data);
        await localStorage.setAccount(account);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  logoutUser() async {
    await auth.signOut();
    if (localStorage.prefs == null) {
      await localStorage.init();
    }
    await localStorage.prefs.clear();
  }
}
