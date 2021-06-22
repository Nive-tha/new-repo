import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calendersecondpage.dart';

class CalenderPractice extends StatefulWidget {
  @override
  _CalenderPracticeState createState() => _CalenderPracticeState();
}

class _CalenderPracticeState extends State<CalenderPractice> {
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var bottom = kBottomNavigationBarHeight;
    var safeArea = MediaQuery.of(context).padding.top;
    var padding = MediaQuery.of(context).padding;
    var today = DateTime.now();

    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: ((height - bottom) * 0.15),
              width: width,
              color: Colors.teal,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: ((height - bottom) * 0.15) * 0.5,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: Colors.teal,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Calendar',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.teal),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: (height - bottom) * 0.85,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      height: (((height - bottom) * 0.85) * 0.30) - 8,
                      width: width,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Image.asset('images/wedding.png'),
                    ),
                  ),
                  Container(
                    height: ((height - bottom) * 0.85) * 0.38,
                    width: width,
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: TableCalendar(
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
                          color: Colors.blue,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        selectedTextStyle: TextStyle(color: Colors.white),
                        todayDecoration: BoxDecoration(
                          color: Colors.greenAccent,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        defaultDecoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        weekendDecoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        rangeStartDecoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        rangeEndDecoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      headerStyle: HeaderStyle(
                        formatButtonVisible: true,
                        titleCentered: true,
                        formatButtonShowsNext: false,
                        formatButtonDecoration: BoxDecoration(
                          color: Colors.purple,
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
                      headerVisible: false,
                    ),
                  ),
                  Container(
                    height: ((height - bottom) * 0.85) * 0.07,
                    padding: EdgeInsets.only(left: 10, right: 10, top: 4),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Today Remainder',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  Container(
                    height: ((height - bottom) * 0.85) * 0.15,
                    width: width,
                    child: Card(
                      color: Colors.grey.shade100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('images/wedding.png'),
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  Text(
                                    'Sivangi Birthday',
                                    style: TextStyle(
                                      color: Colors.teal,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('dd-MMMM-yyyy').format(today),
                                    style: TextStyle(
                                      color: Colors.teal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.cake,
                                size: 40,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 4.0,
                      bottom: 4,
                    ),
                    child: Container(
                      height: (((height - bottom) * 0.85) * 0.1) - 8,
                      width: width,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.teal,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CalendarSecondPage()));
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
