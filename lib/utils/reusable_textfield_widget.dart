import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String hintText;
  final Color fillColor;
  final Color textColor;
  final double borderRadius;

  const ReusableTextField({
    Key? key,
    this.onChanged,
    required this.hintText,
    required this.fillColor,
    required this.textColor,
    this.borderRadius = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
