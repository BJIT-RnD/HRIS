// viewmodel/check_location_viewmodel.dart

import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/location_model.dart';
import 'dart:math' as math;

class CheckLocationViewModel extends GetxController {
  final _currentLocation = Rx<LocationModel?>(null);
  final _previousLocation = ''.obs;
  final _isInTargetArea = false.obs;

  LocationModel? get currentLocation => _currentLocation.value;
  String get previousLocation => _previousLocation.value;
  bool get isInTargetArea => _isInTargetArea.value;

  @override
  void onInit() {
    super.onInit();
    loadPreviousLocation();
    getCurrentLocation();
  }

  Future<void> loadPreviousLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _previousLocation.value = prefs.getString('previousLocation') ?? '';
  }

  Future<void> getCurrentLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    LocationData currentLocation = await location.getLocation();
    _currentLocation.value = LocationModel(
        latitude: currentLocation.latitude!,
        longitude: currentLocation.longitude!);
    _isInTargetArea.value = checkIfInTargetArea(currentLocation);
  }

  bool checkIfInTargetArea(LocationData location) {
    // Example: Check if latitude and longitude fall within a predefined range.
    double targetLatitude = 37.7749;
    double targetLongitude = -122.4194;

    double distance = calculateDistance(
      location.latitude!,
      location.longitude!,
      targetLatitude,
      targetLongitude,
    );

    // Assuming a target area of 1 kilometer
    return distance <= 1.0;
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double radius = 6371.0; // Earth's radius in kilometers
    double dLat = _toRadians(lat2 - lat1);
    double dLon = _toRadians(lon2 - lon1);

    double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_toRadians(lat1)) *
            math.cos(_toRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return radius * c;
  }

  double _toRadians(double degree) {
    return degree * (math.pi / 180.0);
  }
}
