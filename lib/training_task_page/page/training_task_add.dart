import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:trainngtaskcalcapp/parts/notification_dialog.dart';
import 'package:trainngtaskcalcapp/parts/notification_dialog_second.dart';
import 'package:trainngtaskcalcapp/training_task_page/model/trainig_task_model.dart';

class AddTaskPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TrainingTaskModel>(
        create: (context) => TrainingTaskModel(),
        child: Consumer<TrainingTaskModel>(builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(title: Text('基本情報入力')),
            body: SingleChildScrollView(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  // weightInput(model,context),
                  ListTile(
                    title: Text('体重'),
                    subtitle: Text(model.currentWeightIndex.toString()),
                    onTap: () {
                      showDialog(context: context,
                          builder: (BuildContext context) {
                            return NumberPickerDialog.integer(
                                title: Text('体重を入力してください'),
                                minValue: 30,
                                maxValue: 120,
                                initialIntegerValue: model.currentWeightIndex);
                          }).then((weight) {
                        if (weight == null) return;
                        model.currentWeightIndex = weight;
                      });
                    },
                  ),
                  ListTile(title: Text('トレーニング開始時間'),
                      subtitle: Text(model.dateFormat.format(model.selectedDate)),
                      onTap: () async{
                          showDateTimeDialog(context,
                           onSelectedDate:(selectedDate){
                           model.selectedDate=selectedDate;
                           },
                           initialDate: model.selectedDate);
                      }),

                  ListTile(title: Text('トレーニング終了時間'),
                      subtitle: Text(model.dateFinishFormat.format(model.selectedFinishDate)),
                      onTap: () async{
                           showDateTimeDialogSecond(context,
                               onSelectedSecondDate:(selectedDate){
                                model.selectedFinishDate=selectedDate;
                               },
                               initialSecondDate: model.selectedFinishDate);
                      }),
                  ListTile(title: Text('トレーニング内容入力'),),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context,i){
                    return ListTile(
                      title: Text('筋トレ'),
                    );
                  },
                  itemCount: model.indexNumber,),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
                onPressed: (){
              model.indexNumber++;
            }),
          );
        }));
  }

}




