import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:planrr/utils.dart';
import 'package:table_calendar/table_calendar.dart';

//The event object
class Event{
  final String title;


  String toString()=>this.title;

  Event({required this.title});
}
List<Event> eventList = [];

//An array list of events 
final events = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
);

