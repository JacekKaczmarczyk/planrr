import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:planrr/event.dart';


class Calendar extends StatefulWidget {
  @override
  _Calendar createState() => _Calendar();
}



class _Calendar extends State<Calendar>{


  
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late final ValueNotifier<List<Event>> _selectedEvents;
  TextEditingController _eventController = TextEditingController();


  @override
  void initState(){
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }
  
  @override
  void dispose(){
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day){
    return events[day] ??[];
  }


  void _onDaySelected(DateTime selectedDay, DateTime focusedDay){
    if(!isSameDay(_selectedDay, selectedDay)){
      setState(() {
        _focusedDay=focusedDay;
        _selectedDay=selectedDay;
        
      });
      _selectedEvents.value=_getEventsForDay(selectedDay);
    }
  }




  @override
  Widget build(BuildContext context) {

    initializeDateFormatting('pl_PL',null);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Planrr Calendar")
        ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2042, 12, 31),
            
            focusedDay: _focusedDay,
            calendarFormat: _format,
            locale: 'pl_PL',
            eventLoader: _getEventsForDay,
            selectedDayPredicate: (day){
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay){
              if(!isSameDay(_selectedDay, selectedDay)){
                setState((){
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format){
              if(_format != format){
                setState(() {
                  _format = format;
                });
              }
            },
            onPageChanged: (focusedDay){
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _){
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder:(context, index){
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}'),
                      ),
                      );
                  }
                  );
              }
            ),
          )
        ],
        
        ),
        floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Add Event"),
            content: TextFormField(
              controller: _eventController,
            ),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  if (_eventController.text.isEmpty) {

                  } else {
                    //najpierw dodać _eventController.text do List<Event>
                    //dodać nową listę do events ???
                    //trzeba połączyć eventList i HashMapę, jakoś ją zainicjować i to wklepać czy coś???
                    eventList.add(Event(title: _eventController.text));
                    

                  }
                  Navigator.pop(context);
                  _eventController.clear();
                  setState((){});
                  return;
                },
              ),
            ],
          ),
        ),
        label: Text("Add Event"),
        icon: Icon(Icons.add),
      ),
    );

    
  }


}