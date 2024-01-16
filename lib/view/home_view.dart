import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_demo/view/check_location_view.dart';
import 'package:navigation_demo/view/open_camera_view.dart';
import 'package:navigation_demo/view/open_calender_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Navigation App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set the default hex color here
      ),
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFF89DEA5),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => CheckLocationView());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(
                    0xFF89DEA5), // Set the hex color for this button
              ),
              child: const Text('Check Location'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => OpenCameraView());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(
                    0xFF89DEA5), // Set the hex color for this button
              ),
              child: const Text('Open Camera'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => OpenCalendarView());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(
                    0xFF89DEA5), // Set the hex color for this button
              ),
              child: const Text('Open Calendar'),
            ),
          ],
        ),
      ),
    );
  }
}
