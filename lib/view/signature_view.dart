import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_demo/view/profile_view.dart';
import '../viewmodel/signature_viewmodel.dart';
import 'package:signature/signature.dart';
import '../utils/half_circle_painter.dart';
import '../utils/reusable_text_widget.dart';

class SignatureView extends StatelessWidget {
  final viewModel = Get.put(SignatureViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100.0,
            child: CustomPaint(
              painter: HalfCirclePainter(context),
            ),
          ),
          const SizedBox(height: 100),
          const Align(
            child: ReusableTextWidget(
              text: 'Your Signature',
              backgroundColor: Color(0xFF89DEA5),
              textColor: Colors.black,
              borderRadius: 10,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(height: 20),
          // Signature field
          Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Signature(
              controller: viewModel.signatureController,
              height: 200,
              width: 300,
              backgroundColor: Colors.white,
            ),
          ),
          // Row of buttons at the bottom
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.off(() => const ProfileView());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF89DEA5),
                ),
                child: const Text(
                  'Back',
                  style: TextStyle(
                    color: Colors.black, // Font color of the button text
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.clearSignature();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF89DEA5),
                ),
                child: const Text(
                  'Clear',
                  style: TextStyle(
                    color: Colors.black, // Font color of the button text
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.saveSignature();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF89DEA5),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.black, // Font color of the button text
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
