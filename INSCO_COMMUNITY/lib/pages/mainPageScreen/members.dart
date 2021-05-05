import 'package:INSCO_COMMUNITY/component/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MembersPage extends StatefulWidget {
  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colour.textfieldColor,
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 5.0),
            child: Container(
              // decoration: BoxDecoration(
              //     color: Colors.blue,
              //     borderRadius: BorderRadius.all(Radius.circular(25.0))),
              width: double.infinity,
              child: TextFormField(
                decoration: InputDecoration(
        prefixStyle: GoogleFonts.lato(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
        filled: true,
        fillColor: Colors.indigo[400],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),       
        hintText: "Search users ",
        hintStyle: GoogleFonts.lato(
            fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey),
      ),
              ),
            ),
          ),
          Text("members page"),
        ],
      )),
    );
  }
}
