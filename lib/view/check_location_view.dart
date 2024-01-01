// views/check_location_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_demo/viewmodel/check_location_viewmodel.dart';

class CheckLocationView extends StatelessWidget {
  final CheckLocationViewModel _controller = Get.put(CheckLocationViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => _controller.currentLocation != null
                ? Column(
                    children: [
                      Text(
                          'Current Latitude: ${_controller.currentLocation!.latitude}'),
                      Text(
                          'Current Longitude: ${_controller.currentLocation!.longitude}'),
                    ],
                  )
                : const Text('Fetching location...')),
            const SizedBox(height: 20),
            // Obx(() => Text('Previous Location: ${_controller.previousLocation}')),
            // SizedBox(height: 20),
            Obx(() => Text('Is in Target Area: ${_controller.isInTargetArea}')),
          ],
        ),
      ),
    );
  }
}
