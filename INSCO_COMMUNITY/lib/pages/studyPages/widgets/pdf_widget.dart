import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/pages/studyPages/view/pdfViewer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PdfDoc extends StatefulWidget {
  final String id;
  final String name;
  final String path;

  PdfDoc({
    this.id,
    this.name,
    this.path,
  });

  factory PdfDoc.fromDocument(DocumentSnapshot doc) {
    return PdfDoc(
      id: doc['id'],
      path: doc['path'],
      name: doc['name'],
    );
  }

  @override
  _PdfDocState createState() => _PdfDocState(
        id: this.id,
        name: this.name,
        path: this.path,
      );
}

class _PdfDocState extends State<PdfDoc> {
  final String id;
  final String name;
  final String path;

  _PdfDocState({this.id, this.name, this.path});

  syllabusHeader() {
    return Column(
      children: [
        SizedBox(height: 1.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                _sendPath(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colour.buttonColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Center(
                      child: Text(
                        name.toUpperCase(),
                        style: GoogleFonts.lato(
                            color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 1.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(
            thickness: 1.0,
            color: Colour.lineColor,
          ),
        ),
      ],
    );
  }

  void _sendPath(BuildContext context) {
    String pathValue = path;
    String nameValue = name;

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ViewPdf(pathId: pathValue, nameId: nameValue),
        ));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        syllabusHeader(),
      ],
    );
  }
}
