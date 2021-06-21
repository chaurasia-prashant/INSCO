import 'dart:ui';

import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/modal/account.dart';
import 'package:INSCO_COMMUNITY/pages/search/searchResult.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  Future<QuerySnapshot> searchResultsFuture;

  handleSearch(String query) {
    if (query != null) {
      Future<QuerySnapshot> users = FirebaseFirestore.instance
          .collection("accounts")
          .where("username", isGreaterThanOrEqualTo: query)
          .get();
      setState(() {
        searchResultsFuture = users;
      });
    }
  }

  clearSearch() {
    searchController.clear();
  }


  buildSearchField() {
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
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
                      "Search",
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
        decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: TextFormField(
              controller: searchController,
              
              style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                 ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search by name.",
                hintStyle: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colour.lineColor),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: clearSearch,
                  splashRadius: 4.0,
                ),
              ),
              onFieldSubmitted: handleSearch,
            ),
        ),
      ),
          ),          
        ],
      ),
    );
  }

  Container buildNoContent() {
    return Container(
      child: Center(
        child: Text(
          "Search Members Here",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colour.buttonLight,
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  buildSearchResults() {
    return FutureBuilder(
      future: searchResultsFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
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

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
          child: Scaffold(
          backgroundColor: Colour.primaryColor,
          // appBar: buildSearchField(),
          body: Column(
            children: [
              buildSearchField(),
              SizedBox(
                height: 8.0,
              ),
              Expanded(
                
                child: searchResultsFuture == null
                    ? buildNoContent()
                    : buildSearchResults(),
              ),
            ],
          )),
    );
  }
}


