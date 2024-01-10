// signature_view.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodel/signature_viewmodel.dart';
import 'package:signature/signature.dart';
import '../utils/half_circle_painter.dart';
import '../utils/reusable_text_widget.dart';
import 'package:navigation_demo/view/profile_view.dart';

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
          // Use FutureBuilder to handle asynchronous operations
          // signature_view.dart
          // signature_view.dart
          Obx(() {
            final imagePath = viewModel.signatureImagePath.value;

            return FutureBuilder<String>(
              future: imagePath.isNotEmpty
                  ? Future.value(imagePath)
                  : viewModel.getSignatureImagePath(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData &&
                    File(snapshot.data!).existsSync()) {
                  return Image.file(
                    File(snapshot.data!),
                    height: 200,
                  );
                } else {
                  return Container(
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
                  );
                }
              },
            );
          }),
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
              // Use Obx to conditionally show Clear Image or Clear Signature button
              Obx(() {
                if (viewModel.signatureImagePath.value.isNotEmpty) {
                  // Display Clear Image button if there's a saved image
                  return ElevatedButton(
                    onPressed: () {
                      viewModel.clearSignatureImage();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF89DEA5),
                    ),
                    child: const Text(
                      'Clear Image',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                } else {
                  // Display Clear Signature button if there's no saved image
                  return ElevatedButton(
                    onPressed: () {
                      viewModel.clearSignature();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF89DEA5),
                    ),
                    child: const Text(
                      'Clear Signature',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                }
              }),
              ElevatedButton(
                onPressed: () async {
                  await viewModel.saveSignature();
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
