import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainngtaskcalcapp/training_task_page/model/trainig_task_model.dart';
import 'package:trainngtaskcalcapp/training_task_page/page/training_task_add.dart';
import 'package:trainngtaskcalcapp/training_task_page/taining_calender/training_calender.dart';

class TrainingTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TrainingTaskModel>(
      create: (context)=>TrainingTaskModel()..fetchCalender()..fetchTraining(),
      child: Consumer<TrainingTaskModel>(
        builder: (context,model,child) {
          final training=model.training;
          final listTiles=training
              .map((training) => ListTile(
            title: Text(training.menu),
          ),
          ).toList();
          return Scaffold(
              appBar: AppBar(
                title: Text('トレーニング記録'),
                leading: IconButton(icon: Icon(Icons.add),
                    onPressed: () {
                    //todo トレーニング登録画面
                    }),
              ),
              body:SingleChildScrollView(
                child:Column(
                  children: [
                    TrainingCalender(),
                    ListView(
                      shrinkWrap: true,
                      children: listTiles,
                    )
                  ],
                )

              ),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: (){
              //todo 追加画面
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskPage()));
            }),
          );
        }
      ),
    );
  }
}
