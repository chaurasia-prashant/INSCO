import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/pages/studyPages/widgets/pdf_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<PdfDoc> pdfDoc;

  @override
  void initState() {
    super.initState();
    getSyllabus();
  }

  getSyllabus() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('notes/KLqfJfqkiDjXy74BjRtH/$valueChose')
        .orderBy('id', descending: false)
        .get();
    List<PdfDoc> pdfDoc =
        snapshot.docs.map((doc) => PdfDoc.fromDocument(doc)).toList();
    setState(() {
      this.pdfDoc = pdfDoc;
    });
  }

  buildSyllabus() {
    if (pdfDoc == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView(
        children: pdfDoc,
      );
    }
  }

  String valueChose = 'semester 1';

  List listItem = [
    'semester 1',
    'semester 2',
    'semester 3',
    'semester 4',
    'semester 5',
    'semester 6',
  ];

  dropdownBody() {
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
                      "Notes",
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
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colour.secondaryColorDark,
                  borderRadius: BorderRadius.all(Radius.circular(50.0))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Select Semester',
                      style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                    DropdownButton(
                      underline: SizedBox(
                        height: 0.0,
                      ),
                      dropdownColor: Colour.secondaryColor,
                      value: valueChose,
                      onChanged: (newValue) {
                        setState(() {
                          valueChose = newValue;
                          pdfDoc = [];
                          getSyllabus();
                        });
                      },
                      items: listItem.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 5.0),
                            child: Text(
                              valueItem.toUpperCase(),
                              style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colour.primaryColor,
        key: _scaffoldKey,
        body: Column(
          children: [
            dropdownBody(),
            SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: buildSyllabus(),
            ),
          ],
        ),
      ),
    );
  }
}
