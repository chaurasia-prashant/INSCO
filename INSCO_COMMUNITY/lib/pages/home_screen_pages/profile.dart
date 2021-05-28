import 'package:INSCO_COMMUNITY/component/color.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../homepage.dart';

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  buildProfileHeader() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 60.0,
            backgroundColor: Colors.white,
            backgroundImage: currentUser.photoUrl == ""
                    ? AssetImage("./assets/images/avtar.png")
                    : CachedNetworkImageProvider(currentUser.photoUrl),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            currentUser.username,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.blue[600],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Batch ${currentUser.batch.toString()}",
                  style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colour.lineColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        title: Center(child: Text("Profile")),
        automaticallyImplyLeading: false,
        backgroundColor: Colour.buttonColor,
        // actions: <Widget>[
        //   IconButton(
        //       icon: const Icon(Icons.logout),
        //       onPressed: () {
        //         showAlertDialog(context);
        //       }),
        // ]
      ),
      body: ListView(
        children: <Widget>[
          buildProfileHeader(),
        ],
      ),
    );
  }
}
