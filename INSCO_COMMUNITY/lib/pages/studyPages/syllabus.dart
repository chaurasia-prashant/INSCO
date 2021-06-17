import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/pages/studyPages/widgets/pdf_widget.dart';
import 'package:INSCO_COMMUNITY/pages/studyPages/widgets/study_shimmer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:INSCO_COMMUNITY/widget/header.dart';

class SyllabusPage extends StatefulWidget {
  @override
  _SyllabusPageState createState() => _SyllabusPageState();
}

class _SyllabusPageState extends State<SyllabusPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<PdfDoc> pdfDoc;

  @override
  void initState() {
    super.initState();
    getSyllabus();
  }

  getSyllabus() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('syllabus')
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
      return StudyShimmer();
    } else {
      return ListView(
        children: pdfDoc,
      );
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.primaryColor,
      key: _scaffoldKey,
      appBar: header(context,titleText: "Syllabus"),
      body: RefreshIndicator(
        onRefresh: () => getSyllabus(),
        child: buildSyllabus(),
      ),
    );
  }
}

