// views/open_camera_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodel/camera_viewmodel.dart';

class OpenCameraView extends StatelessWidget {
  final CameraViewModel _controller = Get.put(CameraViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open Camera'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => _controller.imageFile != null
                ? Image.file(_controller.imageFile!)
                : Text('No image selected')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _controller.takePicture();
              },
              child: Text('Take Picture'),
            ),
          ],
        ),
      ),
    );
  }
}
