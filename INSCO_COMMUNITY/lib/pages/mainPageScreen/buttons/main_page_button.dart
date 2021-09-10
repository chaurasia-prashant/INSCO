import 'package:INSCO_COMMUNITY/widget/page_route_transition.dart';
import 'package:flutter/material.dart';

class MainPageButton extends StatelessWidget {
  final Widget widScreen;
  final String imagePath;
  final String buttonName;

  MainPageButton({
    @required this.widScreen,
    this.imagePath,
    this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    // final scale = Screen(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, CustomPageRoute(widget: widScreen));
      },
      child: Container(
          child: Column(children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 35.0,
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(height: 5.0),
        Text(
          buttonName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.0,
          ),
        )
      ])),
    );
  }
}
