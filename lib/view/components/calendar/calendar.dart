import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'utils.dart';
import '../../pages/schedule_appoitment_select_time_view.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Calendar createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Define a list of occupied days
  final List<DateTime> _occupiedDays = [
    DateTime.now().subtract(const Duration(days: 1)),
    DateTime.now().add(const Duration(days: 1)),
    DateTime.now().add(const Duration(days: 2)),
  ];

  @override
  Widget build(BuildContext context) {
    double displayHeight() => MediaQuery.of(context).size.height;
    double displayWidth() => MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
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
                  MaterialPageRoute(
                      builder: (context) => const ScheduleAppoitmentSelectTime()),
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
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.all(8),
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
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.all(8),
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
