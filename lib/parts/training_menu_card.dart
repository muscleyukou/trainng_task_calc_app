import 'package:flutter/material.dart';
import 'package:trainngtaskcalcapp/training_task_page/page/record_weight_set.dart';

class TrainingMenuCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
        elevation: 6,
        shadowColor: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 25,),
            Text('トレーニングメニュー'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '種目名を入力してください'
                ),
              ),
            ),
            Container(
              width: 250,
              height: 50,
              child: RaisedButton(
                color: Colors.blueAccent[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                  child: Text('重量、セットの登録',style: TextStyle(fontSize: 17.0),),
                  onPressed:()=>Navigator.push(context,
                      MaterialPageRoute(builder:(context)=>RecordWeightSet()))),
            )
          ],
        ),
    );
  }
}
