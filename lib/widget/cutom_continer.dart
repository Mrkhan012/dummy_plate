import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final double borderRadius;
  final Border? border;
  final Widget child;

  const CustomContainer({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    this.borderRadius = 0.0,
    this.border,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        border: border,
      ),
      child: child,
    );
  }
}
