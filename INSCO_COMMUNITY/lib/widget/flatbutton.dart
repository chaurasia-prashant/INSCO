import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/widget/font_text.dart';
import 'package:INSCO_COMMUNITY/helper/screen_size.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final String buttonName;

  Button(this.buttonName, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final scale = Screen(context);
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: onPressed,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: scale.horizontal(4), vertical: scale.horizontal(4)),
          child: LatoText(
            buttonName,
            size: 16,
            fontColor: Colors.white,
          ),
        ),
      ),
      color: Colour.buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(scale.horizontal(2.4)),
        side: BorderSide.none,
      ),
    );
  }
}
