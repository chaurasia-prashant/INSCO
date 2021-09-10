import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatefulWidget {
  final String imageUrl;
  final String username;
  ProfileImage({this.imageUrl, this.username});

  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colour.greyLight,
        appBar: AppBar(
          title: Text(widget.username),
          backgroundColor: Colour.buttonColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: '${widget.username}',
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: widget.imageUrl == './assets/images/avtar.png' ? AssetImage('./assets/images/avtar.png') : CachedNetworkImageProvider(widget.imageUrl),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(''),
          ],
        ),
      ),
    );
  }
}
