import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



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
      {this.id,
      this.mobileNumber,
      this.username,
      this.batch,
      this.bio,
      this.email,
      this.isInscoMember,
      this.photoUrl,
      this.title});


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
