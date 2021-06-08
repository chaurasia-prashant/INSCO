import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: SvgPicture.asset('./assets/images/welcome.svg'),
        body:
            "Let's walk through us and enjoy the great plateform of our community",
        title: 'Welcome to INSCO!',
      ),
      PageViewModel(
        image: SvgPicture.asset('./assets/images/study_material.svg'),
        body: "Get all notes and syllabus anywhere and any time",
        title: 'Study Smart',
      ),
      PageViewModel(
        image: SvgPicture.asset('./assets/images/chat.svg'),
        body: "Community to anyone and find all our INSCO society members here",
        title: 'Chat among members',
      ),
      PageViewModel(
        image: SvgPicture.asset('./assets/images/community.svg'),
        body: "Integrate with each other and make INSCO community great ",
        title: 'Great Community',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          done: Text(
            'Done',
            style: TextStyle(color: Colors.black),
          ),
          onDone: () {
            Navigator.pushAndRemoveUntil<dynamic>(
              context,
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => HomePage(),
              ),
              (route) =>
                  false, //if you want to disable back feature set to false
            );
          },
          pages: getPages(),
          globalBackgroundColor: Color(0xFFF8F8F8),
          dotsDecorator: const DotsDecorator(
              activeColor: Colour.buttonColor, activeSize: Size.square(15.0)),
        ),
      ),
    );
  }
}
