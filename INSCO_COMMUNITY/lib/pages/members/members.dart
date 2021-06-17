import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/modal/account.dart';
import 'package:INSCO_COMMUNITY/pages/members/membersResult.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:INSCO_COMMUNITY/widget/search_shimmer.dart';

import '../homepage.dart';

class MembersPage extends StatefulWidget {
  final String getYear;
  MembersPage({Key key, this.getYear}) : super(key: key);

  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    arr();
    handleSearch();
  }

  final usersRef = FirebaseFirestore.instance.collection('accounts');
  Future<QuerySnapshot> searchResultsFuture;
  int cout;
  List batch = [];
  DateTime timestamp = DateTime.now();
  void arr() {
    for (int i = 1974; i <= timestamp.year; i++) {
      batch.add(i);
    }
  }

  handleSearch() {
    Future<QuerySnapshot> users =
        usersRef.where("batch", isEqualTo: valueChose).get();

    usersRef.where("batch", isEqualTo: valueChose).get().then((data) {
      setState(() {
        cout = data.docs.length;
        searchResultsFuture = users;
        // print('cout at $valueChose: $cout');
      });
    });
    // setState(() {
    //   searchResultsFuture = users;
    //   print('cout at $valueChose: $cout');
    // });
  }

  buildSearchResults() {
    return FutureBuilder(
      future: searchResultsFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SearchShimmer();
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

  int valueChose = currentUser.batch != null ? currentUser.batch : 2018;

  dropdownBody() {
    return Container(
      color: Colour.secondaryColor,
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
                    child: Container(
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0),
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
                  color: Colour.secondaryColorDark,
                  borderRadius: BorderRadius.all(Radius.circular(50.0))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Select Batch",
                        style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    DropdownButton(
                      // isExpanded: true,
                      underline: SizedBox(
                        height: 0.0,
                      ),
                      dropdownColor: Colour.secondaryColor,
                      iconEnabledColor: Colors.white,
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
                                  fontSize: 15,
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colour.primaryColor,
        key: _scaffoldKey,
        body: Column(
          children: [
            dropdownBody(),
            SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: cout == 0 ? retText() : buildSearchResults(),
            )
          ],
        ),
      ),
    );
  }
}
