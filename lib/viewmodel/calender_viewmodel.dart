// viewmodel/calendar_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalendarViewModel extends GetxController {
  final TextEditingController noteController = TextEditingController();
  final _prefs = Rx<SharedPreferences?>(null);

  Future<void> initializePrefs() async {
    _prefs.value = await SharedPreferences.getInstance();
  }

  void saveNoteForDate(DateTime date) {
    if (_prefs.value != null) {
      _prefs.value!.setString(date.toString(), noteController.text);
      Get.snackbar(
        'Note Saved',
        'Note saved for ${date.toLocal()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  String getNoteForDate(DateTime date) {
    return _prefs.value?.getString(date.toString()) ?? '';
  }
}
