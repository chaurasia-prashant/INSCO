import 'package:INSCO_COMMUNITY/modal/account.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            'No user in this batch',
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
      color: Color(0xff5804BC),
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(child: Icon(Icons.arrow_back, color: Colors.white),),),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
                      "Members",
                      style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0x8844088D),
                  borderRadius: BorderRadius.all(Radius.circular(50.0))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Select Batch",
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    DropdownButton(
                      // isExpanded: true,
                      underline: SizedBox(
                        height: 0.0,
                      ),
                      dropdownColor: Color(0xFF3F0788),
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
                            child: Text(
                              'Batch ${valueItem.toString()}',
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff121212),
        key: _scaffoldKey,
        body: Column(
          children: [
            dropdownBody(),
            SizedBox(
              height: 8.0,
            ),
            Expanded(
              child:
                  // TODO: add terenery operator to check if no user in the batch and return a retText
                  buildSearchResults(),
            )
          ],
        ),
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
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, right:8.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.white,
                backgroundImage: user.photoUrl == ""
                    ? AssetImage("./assets/images/avtar.png")
                    : CachedNetworkImageProvider(user.photoUrl),
              ),
              title: Text(
                user.username,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: 
               Padding(
                 padding: const EdgeInsets.only(top: 8.0),
                 child: Text(
                  user.title,
                  style: TextStyle(
                      color: Colors.white,),
              ),
               ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 80.0, right: 10.0, top: 1.0, bottom: 1.0),
              child: Divider(height: 1.0, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
