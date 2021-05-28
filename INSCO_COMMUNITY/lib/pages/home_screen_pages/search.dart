import 'package:INSCO_COMMUNITY/component/color.dart';
import 'package:INSCO_COMMUNITY/modal/account.dart';
import 'package:cached_network_image/cached_network_image.dart';
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

  AppBar buildSearchField() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colour.secondaryColor,
      title: Container(
        decoration: BoxDecoration(
            color: Colour.tertioryColor,
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: TextFormField(
            controller: searchController,
            cursorColor: Colors.white,
            style: GoogleFonts.lato(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search by name.",
              hintStyle: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
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
    );
  }

  Container buildNoContent() {
    return Container(
      child: Center(
        child: Text(
          "Find Members",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colour.buttonColor,
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

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        backgroundColor: Colour.primaryColor,
        appBar: buildSearchField(),
        body: Container(
          child: searchResultsFuture == null
              ? buildNoContent()
              : buildSearchResults(),
        ));
  }
}

class UserResult extends StatelessWidget {
  final Account user;

  UserResult(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 8.0),
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
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        user.title,
                        style: TextStyle(
                          color: Colors.deepOrange
                        ),
                      ),
                    ),
                    Text(
                      "Batch ${user.batch}",
                      style: TextStyle(
                        color: Colour.buttonColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 80.0, right: 10.0, top: 1.0, bottom: 1.0),
              child: Divider(height: 1.0, color: Colour.lineColor),
            ),
          ],
        ),
      ),
    );
  }
}
