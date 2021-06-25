import 'package:INSCO_COMMUNITY/constants/color.dart';
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
  String e1 = 'Invalid argument(s): No host specified in URI %22%22';

  String e2 =
      'SocketException: OS Error: Software caused connection abort, errno = 103, address = firebasestorage.googleapis.com, port = 39950';

  String e3 =
      "SocketException: Failed host lookup: 'firebasestorage.googleapis.com' (OS Error: No address associated with hostname, errno = 7)";
  // PDFDocument doc;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colour.buttonColor,
        title: Text(widget.nameId.toUpperCase()),
      ),
      body: Center(
        child: PDF().cachedFromUrl(
          widget.pathId,
          placeholder: (progress) => Center(
            child: Text("Loading... \n \n \n   $progress %"),
          ),
          errorWidget: (e) => Center(
            child: e.toString() == e3
                ? Text('Please check your internet connection') : e.toString() == e2
                ? Text('Internet Disconnected')
                : e.toString() == e1
                    ? Text('File not found')
                    : Text('Something Went Wrong'),
          ),
        ),
      ),
    );
  }
}
