import 'package:flutter/material.dart';
import 'package:ui_generator_app/Core/App_Color/app_color.dart';

class SearchByHeader extends SliverPersistentHeaderDelegate {
  final double flexibleSpace;
  final double backGroundHeight;
  final double stackPaddingTop;
  final double titlePaddingTop;
  final Widget stackChild;

  SearchByHeader({
    this.flexibleSpace = 220,
    this.backGroundHeight = 0,
    required this.stackPaddingTop,
    this.titlePaddingTop = 0,
    required this.stackChild,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var percent = shrinkOffset / (maxExtent - minExtent);
    double calculate = 1 - percent < 0 ? 0 : (1 - percent);
    return SizedBox(
      height: maxExtent,
      child: Stack(
        children: <Widget>[
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: AppColor.gradiantCoverBox,
            ),
          ),
          Positioned(
            top: 120,
            child: Opacity(
              opacity: calculate,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: stackChild,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => flexibleSpace;

  @override
  double get minExtent => kToolbarHeight + 25;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
