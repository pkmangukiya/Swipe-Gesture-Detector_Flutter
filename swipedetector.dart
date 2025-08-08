import 'package:flutter/material.dart';

class SwipeConfiguration {
  final double verticalSwipeMaxWidthThreshold;
  final double verticalSwipeMinDisplacement;
  final double verticalSwipeMinVelocity;

  final double horizontalSwipeMaxHeightThreshold;
  final double horizontalSwipeMinDisplacement;
  final double horizontalSwipeMinVelocity;

  const SwipeConfiguration({
    this.verticalSwipeMaxWidthThreshold = 50.0,
    this.verticalSwipeMinDisplacement = 100.0,
    this.verticalSwipeMinVelocity = 300.0,
    this.horizontalSwipeMaxHeightThreshold = 50.0,
    this.horizontalSwipeMinDisplacement = 100.0,
    this.horizontalSwipeMinVelocity = 300.0,
  });
}

class SwipeDetector extends StatelessWidget {
  final Widget child;
  final VoidCallback? onSwipeUp;
  final VoidCallback? onSwipeDown;
  final VoidCallback? onSwipeLeft;
  final VoidCallback? onSwipeRight;
  final SwipeConfiguration swipeConfiguration;

  const SwipeDetector({
    Key? key,
    required this.child,
    this.onSwipeUp,
    this.onSwipeDown,
    this.onSwipeLeft,
    this.onSwipeRight,
    this.swipeConfiguration = const SwipeConfiguration(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DragStartDetails? verticalStart;
    DragUpdateDetails? verticalUpdate;

    DragStartDetails? horizontalStart;
    DragUpdateDetails? horizontalUpdate;

    return GestureDetector(
      child: child,
      onVerticalDragStart: (details) => verticalStart = details,
      onVerticalDragUpdate: (details) => verticalUpdate = details,
      onVerticalDragEnd: (end) {
        if (verticalStart == null || verticalUpdate == null) return;

        final dx = (verticalUpdate!.globalPosition.dx - verticalStart!.globalPosition.dx).abs();
        final dy = (verticalUpdate!.globalPosition.dy - verticalStart!.globalPosition.dy).abs();
        final velocity = end.primaryVelocity ?? 0.0;

        if (dx > swipeConfiguration.verticalSwipeMaxWidthThreshold) return;
        if (dy < swipeConfiguration.verticalSwipeMinDisplacement) return;
        if (velocity.abs() < swipeConfiguration.verticalSwipeMinVelocity) return;

        if (velocity < 0) {
          onSwipeUp?.call();
        } else {
          onSwipeDown?.call();
        }
      },
      onHorizontalDragStart: (details) => horizontalStart = details,
      onHorizontalDragUpdate: (details) => horizontalUpdate = details,
      onHorizontalDragEnd: (end) {
        if (horizontalStart == null || horizontalUpdate == null) return;

        final dx = (horizontalUpdate!.globalPosition.dx - horizontalStart!.globalPosition.dx);
        final dy = (horizontalUpdate!.globalPosition.dy - horizontalStart!.globalPosition.dy).abs();
        final velocity = end.primaryVelocity ?? 0.0;

        if (dx.abs() < swipeConfiguration.horizontalSwipeMinDisplacement) return;
        if (dy > swipeConfiguration.horizontalSwipeMaxHeightThreshold) return;
        if (velocity.abs() < swipeConfiguration.horizontalSwipeMinVelocity) return;

        if (velocity < 0) {
          onSwipeLeft?.call();
        } else {
          onSwipeRight?.call();
        }
      },
    );
  }
}
