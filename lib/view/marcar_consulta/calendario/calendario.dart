
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'utils.dart';
import '../marcacao_view.dart';


class Calendario extends StatefulWidget {
  @override
  _Calendario createState() => _Calendario();
}

class _Calendario extends State<Calendario> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Define a list of occupied days
  List<DateTime> _occupiedDays = [
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().add(Duration(days: 1)),
    DateTime.now().add(Duration(days: 2)),
  ];

  @override
  Widget build(BuildContext context) {
      double displayHeight() => MediaQuery.of(context).size.height;
      double displayWidth() => MediaQuery.of(context).size.width;
      return Scaffold(
      body: Container(
        width: displayWidth() / 0.5,
        height: 350,
        child: TableCalendar(
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => marcacao2()),
                  );
              });
            }
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              // Call `setState()` when updating calendar format
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            // No need to call `setState()` here
            _focusedDay = focusedDay;
          },
          calendarBuilders: CalendarBuilders(
            // Customize the day cell
            todayBuilder: (context, date, events) {
              bool isOccupied = _occupiedDays.contains(date);

              return Container(
                decoration: BoxDecoration(
                  color: isOccupied ? Colors.red : null,
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.all(4),
                padding: EdgeInsets.all(8),
                child: Text(
                  '${date.day}',
                  style: TextStyle(
                    color: isOccupied ? Colors.white : null,
                  ),
                ),
              );
            },
            // Customize the day cell for the selected day
            selectedBuilder: (context, date, events) {
              bool isOccupied = _occupiedDays.contains(date);

              return Container(
                decoration: BoxDecoration(
                  color: isOccupied ? Colors.red : Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.all(4),
                padding: EdgeInsets.all(8),
                child: Text(
                  '${date.day}',
                  style: TextStyle(
                    color: isOccupied ? Colors.white : Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}