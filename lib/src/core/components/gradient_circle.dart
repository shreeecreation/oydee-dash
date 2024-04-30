import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oydeeedashboard/src/core/core.dart';

class GradientCircle extends StatelessWidget {
  const GradientCircle({
    super.key,
    this.radius = 60,
    required this.child,
    this.borderWidth = 2.0,
    this.gradient = AppColors.userGradient,
    this.showGradient = false,
    this.backgroundColor = AppColors.white,
  });

  final double radius;
  final Widget child;
  final double borderWidth;
  final LinearGradient gradient;
  final bool showGradient;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius.w,
      height: radius.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: showGradient ? gradient : null,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(borderWidth),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: child,
        ),
      ),
    );
  }
}
