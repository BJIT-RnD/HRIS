// signature_viewmodel.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignatureViewModel extends GetxController {
  final _model = SignatureController();

  SignatureController signatureController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  get model => _model;

  void clearSignature() {
    signatureController.clear();
  }

  void saveSignature() {
    // Implement saving logic here
    // e.g., save the signature as an image
    final signatureImage = signatureController.toImage();
  }

  void editSignature() {
    // Example: Allow the user to edit the signature
    print('Editing signature...');
    // Add your edit logic here
  }
}
