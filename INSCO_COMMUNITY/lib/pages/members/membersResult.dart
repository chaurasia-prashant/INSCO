import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/modal/account.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserResult extends StatelessWidget {
  final Account user;

  UserResult(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Material(
              elevation: 8.0,
              shadowColor: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Color(0xFFF3EBFC),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: user.photoUrl == ""
                      ? AssetImage("./assets/images/avtar.png")
                      : CachedNetworkImageProvider(user.photoUrl),
                ),
                title: Text(
                  user.username,
                  style: TextStyle(
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    user.title,
                    
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}