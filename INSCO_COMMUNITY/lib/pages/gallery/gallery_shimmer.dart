import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class GalleryShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 20,
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: Colour.lineColor,
          highlightColor: Colour.greyLight,
          child: Material(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Container(
              height: 800.0,
              width: 800.0,
            ),
          ),
        ),
        staggeredTileBuilder: (index) => new StaggeredTile.count(
            (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
