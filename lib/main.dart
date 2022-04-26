import 'package:flutter/material.dart';
import 'package:planrr/calendar.dart';

import 'home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Planrr",
      home: const Home(),
      theme: ThemeData(
       appBarTheme: const AppBarTheme(
     color: Colors.blue,
    )),
  );
  }
}
