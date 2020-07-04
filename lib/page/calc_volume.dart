import 'package:flutter/material.dart';

class CalcVolume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('トレーニング計算'),),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text('RPE MAX rep calculator'),
          TextField(),
          TextField(),
        ],
      ),
    );
  }
}
