import 'package:flutter/material.dart';

class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;
  final Color color;

  StickyHeaderDelegate({
    required this.child,
    required this.color,
    this.height = 56.0,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      width: double.maxFinite,
      color: color,
      height: height,
      child: child,
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
