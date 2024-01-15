import 'package:flutter/material.dart';

class ReusableTextWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius; // Added border radius parameter
  final AlignmentGeometry alignment; // Added alignment parameter

  const ReusableTextWidget({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.borderRadius = 0.0, // Default to 0.0 if not provided
    this.alignment = Alignment.centerLeft, // Default to center-left
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
