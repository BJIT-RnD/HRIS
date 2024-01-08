import 'package:flutter/material.dart';
import 'package:navigation_demo/utils/colors/app_color.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  const RoundedButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final shapeSize = MediaQuery.of(context).size.width;
    return Container(
      height: shapeSize / 3.2,
      width: shapeSize / 3.2,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.primaryColor,
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
