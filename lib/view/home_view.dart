// views/home_view.dart

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
        primarySwatch: Colors.blue,
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => CheckLocationView());
              },
              child: const Text('Check Location'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => OpenCameraView());
              },
              child: const Text('Open Camera'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => OpenCalendarView());
              },
              child: const Text('Open Calendar'),
            ),
          ],
        ),
      ),
    );
  }
}
