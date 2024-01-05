import 'package:flutter/material.dart';
import 'package:navigation_demo/components/rectangle_with_ellipse.dart';
import 'package:navigation_demo/components/rounded_button.dart';
import 'package:navigation_demo/utils/colors/app_color.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImagePosition = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            RectangleWithEllipse(),
            Padding(
              padding: EdgeInsets.only(
                top: profileImagePosition.height / 5 - 45,
                left: profileImagePosition.width / 4,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      height: profileImagePosition.width / 3.5,
                      width: profileImagePosition.height / 3.5,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/img1.jpg'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.edit_square,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Welcome Sadat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            children: [
              RoundedButton(text: 'Your Signature'),
              SizedBox(
                width: 30,
              ),
              RoundedButton(text: 'Academic Certificates'),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            children: [
              RoundedButton(text: 'Professional Trainings'),
              SizedBox(
                width: 30,
              ),
              RoundedButton(text: 'Training Certificate'),
            ],
          ),
        ),
      ],
    );
  }
}
