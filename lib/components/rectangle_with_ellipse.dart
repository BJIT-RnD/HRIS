import 'package:flutter/material.dart';
import 'package:navigation_demo/utils/colors/app_color.dart';

class RectangleWithEllipse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      child: Stack(
        children: [
          Opacity(
            opacity: 1,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: AppColor.primaryColor,
                height: height / 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }

  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 40);

    var firstStart = Offset(size.width / 2, size.height + 40);
    var firstEnd = Offset(size.width, size.height - 40);

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
}
