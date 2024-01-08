// login_controller.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:navigation_demo/view/home_view.dart';
import 'package:navigation_demo/view/profile_view.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  void onUsernameChanged(String value) {
    username.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }

  void login({required String username, required String password}) {
    // After successful login, fetch data
    authenticate(username, password);
  }

  Future<void> authenticate(String username, String password) async {
    final url =
        'https://script.google.com/macros/s/AKfycbzsMO4iLPlzKhe_W4Ay7BCUdRY5wmAB-FeRRRyd0WS_t9z5BkPsTi314cl1mVxbKLu-2A/exec?authenticate&username=$username&password=$password';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Print the response body before decoding
      print('Response Body: ${response.body}');

      // Attempt to parse the response as JSON
      try {
        var jsonResponse = json.decode(response.body);
        var isAuthenticated = jsonResponse['authenticated'];

        print('Authentication Result: $isAuthenticated');

        if (isAuthenticated) {
          // Save username and password to SharedPreferences
          saveCredentialsLocally(username, password);

          // Navigate to the homepage
          Get.off(
              const ProfileView()); // Change '/homepage' to your actual homepage route
        }
      } catch (e) {
        print('Error decoding JSON: $e');
      }
    } else {
      print('Failed to authenticate. Status code: ${response.statusCode}');
    }
  }

  Future<void> saveCredentialsLocally(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('password', password);
  }
}
