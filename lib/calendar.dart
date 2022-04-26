import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({ Key? key }) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Planrr"),
      centerTitle:true,
      ),
      body: TableCalendar(
        focusedDay: focusedDay,
        firstDay: DateTime(2020),
        lastDay: DateTime(2025),
        calendarFormat: format,
        onFormatChanged: (CalendarFormat _format){
          setState(() {
            format = _format;
          });
        },
        startingDayOfWeek: StartingDayOfWeek.monday,
        daysOfWeekVisible: true,onDaySelected:(DateTime selectDay, DateTime focusDay){
          setState(() {
            selectedDay = selectDay;
            focusedDay = focusDay;
            print(focusDay);
          });
        },
        //Selecting day
          selectedDayPredicate: (DateTime date) {
            return isSameDay(selectedDay, date);
      },

      //To style the calendar
        calendarStyle: const CalendarStyle(
          isTodayHighlighted: true,
          selectedDecoration: BoxDecoration(
            color: Colors.purple,
            shape: BoxShape.circle,
            ),
            selectedTextStyle: TextStyle(color:Colors.white),
            todayDecoration: BoxDecoration(
              color: Colors.pink,
              shape: BoxShape.circle,
            )
        ),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        )
      );
  }
}