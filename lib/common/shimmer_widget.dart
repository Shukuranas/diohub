import 'package:flutter/material.dart';
import 'package:onehub/style/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget? child;
  final BorderRadius? borderRadius;
  final Color baseColor;
  final Color highlightColor;
  ShimmerWidget(
      {this.child,
      this.borderRadius,
      this.baseColor = AppColor.grey,
      this.highlightColor = AppColor.grey2});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: Shimmer.fromColors(
        child: child!,
        baseColor: baseColor,
        highlightColor: highlightColor,
      ),
    );
  }
}
