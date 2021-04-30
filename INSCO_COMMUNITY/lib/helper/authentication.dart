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
    newUser = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (newUser != null) {
      if (localStorage.prefs == null) {
        await localStorage.init();
      }
      localStorage.prefs.setString('key', password);
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
  loginUser(String email, String password) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  logoutUser() {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }
}
