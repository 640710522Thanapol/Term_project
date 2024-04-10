import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  final DateTime firstDay;

  CalendarScreen({required this.firstDay});

  @override
  Widget build(BuildContext context) {
    DateTime lastDay = firstDay.add(Duration(days: 28));
    DateTime currentDate = DateTime.now();
    int daysUntilNextPeriod = lastDay.difference(currentDate).inDays;

    Widget checkDateLeft() {
      if (daysUntilNextPeriod <= 0) {
        return Text('Your period is over');
      } else {
        return Text('Days until next period: $daysUntilNextPeriod days');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Menstrual Cycle Predictor'),
        backgroundColor: Color.fromARGB(255, 198, 152, 211),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TableCalendar(
            firstDay: firstDay,
            lastDay: lastDay,
            focusedDay: firstDay,
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.pinkAccent[100],
                shape: BoxShape.circle,
              ),
              // Highlighting the first 7 days and the last day
              rangeEndTextStyle: TextStyle(color: Colors.white),
              rangeStartTextStyle: TextStyle(color: Colors.white),
              // Ensure all days have the same text style
              defaultTextStyle: TextStyle(color: Colors.black),
            ),
            selectedDayPredicate: (day) {
              return isSameDay(day, firstDay) ||
                  isSameDay(day, lastDay) ||
                  day.isAfter(firstDay) &&
                      day.isBefore(firstDay.add(Duration(days: 7)));
            },
            // Indicate the current day
          ),
          SizedBox(height: 20.0),
          checkDateLeft(),
        ],
      ),
    );
  }
}
