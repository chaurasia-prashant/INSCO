import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/modal/image.dart';
import 'package:INSCO_COMMUNITY/pages/gallery/upload.dart';
import 'package:INSCO_COMMUNITY/pages/mainPageScreen/main_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

final _firestore = FirebaseFirestore.instance;

class OneImage extends StatefulWidget {
  final ImageData imageUrl;
  OneImage({this.imageUrl});

  @override
  _OneImageState createState() => _OneImageState();
}

class _OneImageState extends State<OneImage> {
  bool showLoading = false;
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        Navigator.pop(context);
        deletePost();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Post"),
      content: Text("Sure to delete this post!!"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> deletePost() async {
    setState(() {
      showLoading = true;
    });
    await _firestore.collection('gallery').doc(widget.imageUrl.postId).delete();
    await storageRef.child("gallery/post_${widget.imageUrl.postId}.jpg").delete();

    setState(() {
      showLoading = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colour.greyLight,
        appBar: AppBar(
          backgroundColor: Colour.buttonColor,
          actions: widget.imageUrl.senderId == user.uid ? [
            GestureDetector(
              onTap: () {
                showAlertDialog(context);
              },
              child: Container(child: Icon(Icons.delete)),
            ),
          ] : [Text('')],
        ),
        body: ModalProgressHUD(
          inAsyncCall: showLoading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: 'gallery-${widget.imageUrl.postId}',
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: CachedNetworkImageProvider(
                              widget.imageUrl.mediaUrl),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 15.0, left: 10.0, right: 10.0),
                child: Text(
                  widget.imageUrl.description == null
                      ? ''
                      : widget.imageUrl.description,
                  style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
