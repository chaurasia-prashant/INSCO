import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StudyShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Shimmer.fromColors(
          baseColor: Colour.lineColor,
          highlightColor: Colour.greyLight,
          child: ListView(
            children: [
              StudyShim(),
              StudyShim(),
              StudyShim(),
              StudyShim(),
              StudyShim(),
              StudyShim(),
              StudyShim(),
              StudyShim(),
              StudyShim(),
              StudyShim(),
              
            ],
          ),
        ),
    );
  }
}

class StudyShim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          height: 70.0,
          width: double.infinity,
        ),
      ),
    );
  }
}
