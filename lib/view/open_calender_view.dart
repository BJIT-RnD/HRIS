// views/open_calendar_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../viewmodel/calender_viewmodel.dart';

class OpenCalendarView extends StatelessWidget {
  final CalendarViewModel _controller = Get.put(CalendarViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open Calendar'),
      ),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView to handle keyboard overflow
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2000),
              lastDay: DateTime.utc(2100),
              focusedDay: DateTime.now(),
              onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                _controller.noteController.text =
                    _controller.getNoteForDate(selectedDay);
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller.noteController,
                decoration: InputDecoration(labelText: 'Enter Note'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_controller.noteController.text.isNotEmpty) {
                  DateTime selectedDate = DateTime
                      .now(); // Use DateTime.now() or the selected date, depending on your requirement
                  _controller.saveNoteForDate(selectedDate);
                  _controller.noteController
                      .clear(); // Clear the text field after saving
                } else {
                  // Show an error message or handle empty note input
                  Get.snackbar(
                    'Error',
                    'Please enter a note before saving.',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: Text('Save Note'),
            ),
          ],
        ),
      ),
    );
  }
}
