import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalenderHere extends StatefulWidget {
  @override
  _TableCalenderHereState createState() => _TableCalenderHereState();
}

class _TableCalenderHereState extends State<TableCalenderHere> {
  CalendarFormat format = CalendarFormat.month;
  DateTime? selectedDay;
  var fNowDay = DateTime.now();
  var rangeEnd;
  var rangeStart;
  var rangeSelectionMode = RangeSelectionMode.toggledOn;
  var first;
  var end;
  @override
  Widget build(BuildContext context) {
    var today = DateTime.now();
    return TableCalendar(
      rowHeight: 40,
      daysOfWeekHeight: 20,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(fontSize: 12),
        weekendStyle: TextStyle(fontSize: 12),
      ),
      focusedDay: fNowDay,
      firstDay: DateTime(2016),
      lastDay: DateTime(2022),
      calendarFormat: format,
      onFormatChanged: (formatChanged) {
        setState(() {
          format = formatChanged;
        });
      },
      startingDayOfWeek: StartingDayOfWeek.sunday,
      daysOfWeekVisible: true,
      onDaySelected: (selectDay, focusDay) {
        setState(() {
          selectedDay = selectDay;
          fNowDay = focusDay;
          rangeStart = null;
          rangeEnd = null;
          rangeSelectionMode = RangeSelectionMode.toggledOff;
        });
      },
      selectedDayPredicate: (date) {
        return isSameDay(selectedDay, date);
      },
      calendarStyle: CalendarStyle(
        isTodayHighlighted: true,
        selectedDecoration: BoxDecoration(
          color: Colors.teal,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(35),
        ),
        selectedTextStyle: TextStyle(color: Colors.white),
        todayDecoration: BoxDecoration(
          color: Colors.teal,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(35),
        ),
        defaultDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(35),
        ),
        weekendDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(35),
        ),
        rangeStartDecoration: BoxDecoration(
          color: Colors.teal,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(35),
        ),
        rangeEndDecoration: BoxDecoration(
          color: Colors.teal,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(35),
        ),
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: true,
        titleCentered: true,
        formatButtonShowsNext: true,
        formatButtonDecoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(5),
        ),
        formatButtonTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      rangeSelectionMode: rangeSelectionMode,
      rangeStartDay: rangeStart,
      rangeEndDay: rangeEnd,
      onRangeSelected: (first, end, focusDay) {
        print(first);
        print(end);
        print(focusDay);
        setState(() {
          selectedDay = null;
          fNowDay = focusDay;
          rangeStart = first;
          rangeEnd = end;
          rangeSelectionMode = RangeSelectionMode.toggledOn;
          print(selectedDay);
          print(fNowDay);
          print(rangeStart);
          print(rangeEnd);
          print(rangeSelectionMode);
        });
      },
      onPageChanged: (focusDay) {
        setState(() {
          fNowDay = focusDay;
        });
      },
      headerVisible: true,
    );
  }
}
