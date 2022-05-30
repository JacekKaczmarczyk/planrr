import 'package:flutter/material.dart';

class Plans extends StatelessWidget {

final List<String> entries = <String> ['A','B','C'];
final List<int> colorCodes = <int> [600, 500, 100];
TextEditingController _listController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Plan list"),
      centerTitle:true,
      ),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              height:50,
              child: Center(child: Text('Plan ${entries[index]}')),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
        ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed:() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Add plan"),
            content:  TextFormField(
              controller: _listController,
            ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text("Add"),
              onPressed: (){
                entries.add(_listController.text);

                Navigator.pop(context);
                  _listController.clear();
                  //setState((){});
                  return;
              },)
          ],
          )
          ),
         label: Text("Add Plan"),
         icon: Icon(Icons.add)
         )  
    );
    
  }
}