import 'package:flutter/material.dart';

class CompareMax extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('スタバ'),
      leading: IconButton(icon: Icon(Icons.add),
          onPressed: (){
        print('hello');
      }),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),

      ),
    );
  }
}
