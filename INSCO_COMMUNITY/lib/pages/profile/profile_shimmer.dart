import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colour.lineColor,
      highlightColor: Colour.greyLight,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                  radius: 70.0,
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Center(
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              child: Container(
                  height: 10.0,
                  width: 100.0,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              child: Container(
                  height: 10.0,
                  width: 200.0,
                ),
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            Material(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Container(
                height: 10.0,
                width: 40.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              child: Container(
                  height: 50.0,
                  width: double.infinity,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Material(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  child: Container(
                    height: 10.0,
                    width: 60.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Material(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                      child: Container(
                      height: 10.0,
                      width: 50.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Material(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Container(
                height: 10.0,
                width: 100.0,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Material(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Container(
                height: 10.0,
                width: 100.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              child: Container(
                  height: 50.0,
                  width: double.infinity,
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Material(
                  child: Container(
                    height: 30.0,
                    width: double.infinity,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
