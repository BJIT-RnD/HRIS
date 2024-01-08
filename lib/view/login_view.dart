// login_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodel/login_viewmodel.dart';
import '../utils/reusable_textfield_widget.dart';
import '../utils/reusable_text_widget.dart';
import '../utils/half_circle_painter.dart';

class LoginView extends StatelessWidget {
  final viewmodel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.0,
              child: CustomPaint(
                painter: HalfCirclePainter(context),
              ),
            ),
            const SizedBox(height: 50.0),
            const Text(
              'Login to HRIS',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const ReusableTextWidget(
              text: 'Username',
              backgroundColor: Color(0xFF89DEA5),
              textColor: Colors.black,
              borderRadius: 10,
            ),
            const SizedBox(height: 10.0),
            ReusableTextField(
              onChanged: viewmodel.onUsernameChanged,
              hintText: 'Enter your username',
              fillColor: const Color(0xFFE0E7DF),
              textColor: Colors.black,
              borderRadius: 10.0,
            ),
            const SizedBox(height: 12.0),
            const ReusableTextWidget(
              text: 'Password',
              backgroundColor: Color(0xFF89DEA5),
              textColor: Colors.black,
              borderRadius: 10,
            ),
            const SizedBox(height: 10.0),
            ReusableTextField(
              onChanged: viewmodel.onPasswordChanged,
              hintText: 'Enter your password',
              fillColor: const Color(0xFFE0E7DF),
              textColor: Colors.black,
              borderRadius: 10.0,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                viewmodel.login(
                  username: viewmodel.username.toString(),
                  password: viewmodel.password.toString(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF89DEA5),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.black, // Font color of the button text
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
