import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

extension SkeletonizerExtension on Widget {
  Widget withSkeleton({required bool enabled}) {
    return Skeletonizer(
      enabled: enabled,
      effect: const ShimmerEffect(
        baseColor: Color.fromRGBO(158, 158, 158, 0.6),
        highlightColor: Color.fromRGBO(158, 158, 158, 0.1),
        duration: Duration(seconds: 1),
      ),
      child: this,
    );
  }

  Widget withSliverSkeleton({required bool enabled}) {
    return Skeletonizer.sliver(
      enabled: enabled,
      effect: const ShimmerEffect(
        baseColor: Color.fromRGBO(158, 158, 158, 0.6),
        highlightColor: Color.fromRGBO(158, 158, 158, 0.1),
        duration: Duration(seconds: 1),
      ),
      child: this,
    );
  }
}
