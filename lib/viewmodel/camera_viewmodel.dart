// viewmodel/camera_viewmodel.dart

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CameraViewModel extends GetxController {
  final _imageFile = Rx<File?>(null);

  File? get imageFile => _imageFile.value;

  Future<void> takePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      _imageFile.value = File(pickedFile.path);
    }
  }
}
