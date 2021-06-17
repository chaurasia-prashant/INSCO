import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Shimmer.fromColors(
          baseColor: Colour.lineColor,
          highlightColor: Colour.greyLight,
          child: ListView(
            children: [
              SearchRes(),
              SearchRes(),
              SearchRes(),
              SearchRes(),
              SearchRes(),
              SearchRes(),
              SearchRes(),
              SearchRes(),
              SearchRes(),
              SearchRes(),
              SearchRes(),
              
            ],
          ),
        ),
    );
  }
}

class SearchRes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 30.0,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Container(
                      height: 10.0,
                      width: 200.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Container(
                      height: 10.0,
                      width: 40.0,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
  }
}
