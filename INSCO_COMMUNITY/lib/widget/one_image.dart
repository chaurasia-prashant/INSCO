import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/modal/image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OneImage extends StatefulWidget {
  final ImageData imageUrl;
  OneImage({this.imageUrl});

  @override
  _OneImageState createState() => _OneImageState();
}

class _OneImageState extends State<OneImage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colour.greyLight,
        appBar: AppBar(
          backgroundColor: Colour.buttonColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: CachedNetworkImageProvider(widget.imageUrl.mediaUrl),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 15.0, left: 10.0, right:10.0 ),
              child: Text(widget.imageUrl.description == null
                  ? ''
                  : widget.imageUrl.description,
                  style: GoogleFonts.lato(fontWeight: FontWeight.bold ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
