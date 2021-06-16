import 'package:INSCO_COMMUNITY/widget/one_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/modal/image.dart';
import 'package:INSCO_COMMUNITY/pages/gallery/upload.dart';
import 'package:INSCO_COMMUNITY/widget/page_route_transition.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colour.greyLight,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, CustomPageRoute(widget: Upload()));
          },
          backgroundColor: Colour.buttonColor,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colour.buttonColor,
          title: Text('Gallery'),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: postsRef.orderBy('postId', descending: true).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colour.buttonColor,
                  ),
                );
              }
              List images = [];
              snapshot.data.docs.forEach((doc) {
                ImageData image = ImageData.fromJson(doc.data());
                images.add(image);
              });
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: images.length,
                  itemBuilder: (context, index) =>
                      ImageCard(imagedata: images[index]),
                  staggeredTileBuilder: (index) => new StaggeredTile.count(
                      (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                ),
              );
            }),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final ImageData imagedata;
  ImageCard({this.imagedata});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CustomPageRoute(
                widget: OneImage(
              imageUrl: imagedata,
            )));
        // print(imagedata.mediaUrl);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(imagedata.mediaUrl),
          ),
        ),
      ),
    );
  }
}
