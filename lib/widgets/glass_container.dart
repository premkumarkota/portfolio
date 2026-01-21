import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final Color? color;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Border? border;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;

  const GlassContainer({
    super.key,
    required this.child,
    this.blur = 10,
    this.opacity = 0.1,
    this.color,
    this.borderRadius,
    this.padding,
    this.margin,
    this.border,
    this.width,
    this.height,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            width: width,
            height: height,
            alignment: alignment,
            padding: padding,
            decoration: BoxDecoration(
              color: (color ?? AppColors.cardColor).withOpacity(opacity),
              borderRadius: borderRadius ?? BorderRadius.circular(20),
              border:
                  border ??
                  Border.all(color: Colors.white.withOpacity(0.1), width: 1.5),
              gradient: LinearGradient(
                colors: [
                  (color ?? Colors.white).withOpacity(opacity + 0.05),
                  (color ?? Colors.white).withOpacity(opacity),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
