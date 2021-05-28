import 'package:INSCO_COMMUNITY/component/color.dart';
import 'package:flutter/material.dart';

const kSendButtonDecoration = BoxDecoration(
  color: Colour.buttonColor,
 borderRadius: BorderRadius.all(Radius.circular(30))
);



const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  hintStyle: TextStyle(color:Colors.white),
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  color: Colour.secondaryColor,
 borderRadius: BorderRadius.all(Radius.circular(30))
);

