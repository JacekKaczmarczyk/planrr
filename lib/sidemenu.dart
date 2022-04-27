
import 'package:flutter/material.dart';
import 'package:planrr/calendar.dart';
import 'package:planrr/goals.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.calendar_month),
            title: Text('Calendar'),
            onTap: () => {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Calendar()),
             )}, //Navigation to Calendar
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Plan list'),
            onTap: () => {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Goals()),
             )}, //Navigation to Goal List,
          ),
        ],
      ),
    );
  }
}
