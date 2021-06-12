import 'package:INSCO_COMMUNITY/pages/gallery/upload.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {


  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: (){Navigator.push(context,
                MaterialPageRoute(builder: (context) => Upload()));},
              child: Container(
                child: Icon(Icons.add),
              ),
            )
          ],
        ),
        body: Container(
          child: Text('GalleryPage'),
        ),
      ),
    );
  }
}
