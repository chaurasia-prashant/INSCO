import 'package:INSCO_COMMUNITY/modal/account.dart';
import 'package:INSCO_COMMUNITY/widget/header.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MembersPage extends StatefulWidget {
  final String getYear;
  MembersPage({Key key, this.getYear}) : super(key: key);

  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage>
    with AutomaticKeepAliveClientMixin<MembersPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    arr();
    handleSearch();
  }

  final usersRef = FirebaseFirestore.instance.collection('accounts');
  Future<QuerySnapshot> searchResultsFuture;

  handleSearch() {
    Future<QuerySnapshot> users =
        usersRef.where("batch", isEqualTo: valueChose).get();
    setState(() {
      searchResultsFuture = users;
    });
  }

  buildSearchResults() {
    return FutureBuilder(
      future: searchResultsFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text("Loading");
        }
        List<UserResult> searchResults = [];
        snapshot.data.docs.forEach((doc) {
          Account user = Account.fromJson(doc.data());
          UserResult searchResult = UserResult(user);
          searchResults.add(searchResult);
        });
        return ListView(
          children: searchResults,
        );
      },
    );
  }

  Center retText() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            'Sorry no Data yet Uploaded',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    ));
  }

  int valueChose = 2018;

  final DateTime timestamp = DateTime.now();

  List batch = [];
  void arr() {
    for (int i = 1974; i <= timestamp.year; i++) {
      batch.add(i);
    }
  }

  dropdownBody() {
    return Container(
      color: Colors.deepOrange,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text('Select Batch Here'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: DropdownButton(
              // isExpanded: true,
              underline: SizedBox(height: 0.0,),
              dropdownColor: Colors.white,
              value: valueChose,
              onChanged: (newValue) {
                setState(() {
                  valueChose = newValue;
                  handleSearch();
                });
              },
              items: batch.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    child: Text('Batch ${valueItem.toString()}'),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      key: _scaffoldKey,
      appBar: header(context, titleText: 'Members'),
      body: Column(
        children: [
          dropdownBody(),
          Expanded(
            child:
                searchResultsFuture == null ? retText() : buildSearchResults(),
          )
        ],
      ),
    );
  }
}

class UserResult extends StatelessWidget {
  final Account user;

  UserResult(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 8.0,
                      spreadRadius: 4.0),
                ]),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: user.photoUrl == "" ? AssetImage("./assets/images/avtar.png") :CachedNetworkImageProvider(user.photoUrl),
                ),
              ),
              title: Text(
                user.username,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),            
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60.0, right: 10.0),
            child: Divider(height: 2.0, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
