import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class ViewPdf extends StatefulWidget {
  final String pathId;
  final String nameId;


  ViewPdf({Key key, @required this.pathId, @required this.nameId})
      : super(key: key);

  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  // PDFDocument doc;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nameId),
      ),
      body: Center(
        child: PDF().cachedFromUrl(
          widget.pathId,
        ),
      ),
    );
  }
}
