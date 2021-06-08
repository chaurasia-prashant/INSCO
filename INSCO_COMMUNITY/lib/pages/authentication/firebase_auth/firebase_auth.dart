import 'package:INSCO_COMMUNITY/modal/account.dart';

abstract class FirebaseAuthFunctions {
  createUserInFirebase(String email, String password);
  saveDataInFirebase(Account account);
  saveDataInLocalStorage(Account account);
  loginUser(String email, String password);
  logoutUser();
}
