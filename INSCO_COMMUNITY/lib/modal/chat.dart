import 'package:cloud_firestore/cloud_firestore.dart';

class ChatData {
  String id;
  String sender;
  String msg;
  Timestamp msgTime;
  String msgId;
  bool isVisibal;

  ChatData({
    this.id,
    this.sender,
    this.msg,
    this.msgTime,
    this.msgId,
    this.isVisibal,
  });



  ChatData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender = json['sender'];
    msg = json['msg'];
    msgTime = json['msgTime'];
    msgId = json['msgId'];
    isVisibal = json['isVisibal'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['sender'] = sender;
    data['msg'] = msg;
    data['msgTime'] = msgTime;
    data['msgId'] = msgId;
    data['isVisibal'] = isVisibal;
    return data;
  }
}
