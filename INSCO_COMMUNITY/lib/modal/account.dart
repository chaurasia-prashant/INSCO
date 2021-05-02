import 'package:flutter/widgets.dart';

class Account {
  String id;
  String username;
  String email;
  String photoUrl;
  String bio;
  int batch;
  bool isInscoMember;
  String title;
  String mobileNumber;

  Account(
      {@required this.id,
      this.mobileNumber,
      @required this.username,
      @required this.batch,
      this.bio,
      @required this.email,
      @required this.isInscoMember,
      this.photoUrl,
      @required this.title});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    photoUrl = json['photoUrl'];
    email = json['email'];
    bio = json['bio'];
    batch = json['batch'];
    isInscoMember = json['isInscoMember'];
    title = json['title'];
    mobileNumber = json['mobileNumber'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['photoUrl'] = photoUrl == null ? '' : photoUrl;
    data['bio'] = bio == null ? '' : bio;
    data['batch'] = batch;
    data['isInscoMember'] = isInscoMember;
    data['title'] = title;
    data['mobileNumber'] = mobileNumber == null ? '' : mobileNumber;
    return data;
  }
}
