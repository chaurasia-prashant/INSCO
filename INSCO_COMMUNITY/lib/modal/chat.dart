import 'package:cloud_firestore/cloud_firestore.dart';

class ChatData {
  String id;
  String sender;
  int batch;
  String title;
  String msg;
  Timestamp msgTime;

  ChatData(
      {this.id, this.sender, this.batch, this.title, this.msg, this.msgTime});

  ChatData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender = json['sender'];
    batch = json['batch'];
    title = json['title'];
    msg = json['msg'];
    msgTime = json['msgTime'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['sender'] = sender;
    data['batch'] = batch;
    data['title'] = title;
    data['msg'] = msg;
    data['msgTime'] = msgTime;
    return data;
  }
}
