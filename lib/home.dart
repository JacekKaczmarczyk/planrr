import 'package:flutter/material.dart';

import 'calendar.dart';

class Home extends StatelessWidget{
const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planrr'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Calendar'),
          onPressed: () {
            Navigator.push(
              context,
             MaterialPageRoute(builder: (context) => const Calendar()),
             );
          },
          )
      ),
    );
  }

}