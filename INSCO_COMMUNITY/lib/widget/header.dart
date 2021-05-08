import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar header(context,
    {bool isAppTitle = false, String titleText, removeBackButton = false}) {
  return AppBar(
    automaticallyImplyLeading: removeBackButton ? false : true,
    title: Text(
      isAppTitle ? "INSCO" : titleText,
      style: GoogleFonts.lato(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      overflow: TextOverflow.ellipsis,
    ),
    centerTitle: true,
    backgroundColor: Color(0xff5804BC),
  );
}
