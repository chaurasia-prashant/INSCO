import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class DropDownField extends StatelessWidget {
  final textAlignment;
  final Color fillColor;
  final double borderWidth;
  final BorderStyle borderStyle;
  final Color borderColor;
  final Function onChanged;
  final List items;
  final String value;
  final String hintText;
  DropDownField({
    @required this.textAlignment,
    this.fillColor = Colour.textfieldColor,
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
    this.borderStyle = BorderStyle.none,
    this.onChanged,
    this.items,
    this.value,
    this.hintText,
  });
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      // isExpanded: true,
      dropdownColor: Colors.white,
      hint: Text(hintText),
      value: 2018,
      onChanged: onChanged,
      items: [],
      decoration: InputDecoration(
        prefixStyle: GoogleFonts.lato(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(
              width: borderWidth, style: borderStyle, color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
              width: borderWidth, style: borderStyle, color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
              width: borderWidth, style: borderStyle, color: borderColor),
        ),
      ),
    );
  }
}
