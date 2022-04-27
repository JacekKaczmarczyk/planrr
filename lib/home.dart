import 'package:flutter/material.dart';
import 'package:planrr/sidemenu.dart';

import 'calendar.dart';

class Home extends StatelessWidget{
const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Planrr'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Welcome to home page'),
      ),
    );
  }

}