import 'package:INSCO_COMMUNITY/modal/account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences prefs;
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  LocalStorage() {
    this.init();
  }

  Future<void> setAccount(Account account) async {
    if (prefs == null) {
      await this.init();
    }

    prefs.setString('id', account.id);
    prefs.setString('email', account.email);
    prefs.setString('username', account.username);
    prefs.setString('photoUrl', account.photoUrl);
    prefs.setString('bio', account.bio);
    prefs.setString('title', account.title);
    prefs.setInt('batch', account.batch);
    prefs.setBool('isInscoMember', account.isInscoMember);
  }

  Future<Account> getAccount() async {
    if (prefs == null) {
      await this.init();
    }
    Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = prefs.getString('id');
    data['username'] = prefs.getString('username');
    data['email'] = prefs.getString('email');
    data['photoUrl'] = prefs.getString('photoUrl');
    data['bio'] = prefs.getString('bio');
    data['batch'] = prefs.getInt('batch');
    data['isInscoMember'] = prefs.getBool('isInscoMember');
    data['title'] = prefs.getString('title');
    return Account.fromJson(data);
  }
}
