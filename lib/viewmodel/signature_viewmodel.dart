// signature_viewmodel.dart
import 'dart:io';
import 'package:get/get.dart';
import 'package:signature/signature.dart';
import 'package:path_provider/path_provider.dart';

class SignatureViewModel extends GetxController {
  final signatureController = SignatureController();

  RxString signatureImagePath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Load the saved signature image path when the ViewModel is initialized
    loadSignatureImagePath();
  }

  void clearSignature() {
    signatureController.clear();
  }

  Future<void> saveSignature() async {
    // Export the signature as PNG bytes
    final signaturePngBytes = await signatureController.toPngBytes();

    // Save the image to the app directory
    final imagePath = await _getSignatureImagePath();
    File(imagePath).writeAsBytesSync(signaturePngBytes!);

    // Update signature image path
    signatureImagePath.value = imagePath;
  }

  Future<void> loadSignatureImagePath() async {
    // Get the image path from the app directory
    signatureImagePath.value = await _getSignatureImagePath();
  }

  Future<void> clearSignatureImage() async {
    // Delete the saved image file
    final imagePath = await _getSignatureImagePath();
    File(imagePath).deleteSync();

    // Set the signature image path to an empty string
    signatureImagePath.value = '';
  }

  Future<String> getSignatureImagePath() async {
    return await _getSignatureImagePath();
  }

  Future<String> _getSignatureImagePath() async {
    final appDir = await getApplicationDocumentsDirectory();
    return '${appDir.path}/signature_image.png';
  }
}
