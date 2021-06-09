import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                  radius: 70.0,
                  backgroundColor: Colour.primaryColor,
                  backgroundImage: AssetImage("./assets/images/avtar.png")),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Center(
            child: Text(
              'Prashant Kumar Chaurasia',
              style: GoogleFonts.lato(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Text(
              'pkc5683@gmail.com',
              style: GoogleFonts.lato(
                  fontSize: 13,
                  color: Colour.buttonColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 35.0,
          ),
          Text(
            "About",
            style: TextStyle(fontWeight: FontWeight.bold,),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Text(
              'something about user',
              style: GoogleFonts.lato(fontSize: 14),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Text(
                'Batch',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  '2018',
                  style: GoogleFonts.lato(fontSize: 15),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            "Student",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(child: Icon(Icons.work, size: 16)),
              ),
              Text(
                'Work at',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0,top:10.0),
            child: Text(
              'Tata Power',
              style: GoogleFonts.lato(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                color: Colour.greyLight,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                  child: Row(
                    children: [
                      Expanded(child: Text('Contact me on',
                      style: GoogleFonts.lato(fontSize: 15, fontWeight:FontWeight.bold ),
                      ),),
                      Container(
                          height: 40.0,
                          width: 40.0,
                          child: Image.asset("./assets/images/whatsapp.png")),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
