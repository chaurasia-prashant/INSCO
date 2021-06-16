import 'package:cloud_firestore/cloud_firestore.dart';

class ImageData {
  String postId;
  String senderId;
  String mediaUrl;
  String description;


  ImageData({
    this.postId,
    this.senderId,
    this.mediaUrl,
    this.description,

  });



  ImageData.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    senderId = json['senderId'];
    mediaUrl = json['mediaUrl'];
    description = json['description'];

  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['postId'] = postId;
    data['senderId'] = senderId;
    data['mediaUrl'] = mediaUrl;
    data['description'] = description;

    return data;
  }
}
