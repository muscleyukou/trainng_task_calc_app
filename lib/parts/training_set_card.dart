import 'package:flutter/material.dart';

class TrainingSetWeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Column(
            children: [
              Container(
                  color: Colors.blueAccent[100],
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    '重量と回数の入力',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                  )),
              //todo modelの追加
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 160,
                    child: Column(
                      children: [
                        Text(
                          '重量',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        TextField(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 160,
                    child: Column(
                      children: [
                        Text('回数'),
                        TextField(),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'メモ',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
