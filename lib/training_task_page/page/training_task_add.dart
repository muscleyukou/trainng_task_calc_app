import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:trainngtaskcalcapp/parts/card.dart';
import 'package:trainngtaskcalcapp/parts/notification_dialog.dart';
import 'package:trainngtaskcalcapp/parts/notification_dialog_second.dart';
import 'package:trainngtaskcalcapp/parts/training_menu_card.dart';
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
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: CardInput(
                      icon: Icons.people,
                      textFirst: '体重',
                      textSecond: model.currentWeightIndex.toString(),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return NumberPickerDialog.integer(
                                  title: Text('体重を入力してください'),
                                  minValue: 30,
                                  maxValue: 120,
                                  initialIntegerValue:
                                  model.currentWeightIndex);
                            }).then((weight) {
                          if (weight == null) return;
                          model.currentWeightIndex = weight;
                        });
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: CardInput(
                      icon: Icons.timer,
                      textFirst: 'トレーニング開始時間',
                      textSecond: model.dateFormat.format(model.selectedDate),
                      onTap: () {
                        showDateTimeDialog(context,
                            onSelectedDate: (selectedDate) {
                              model.selectedDate = selectedDate;
                            }, initialDate: model.selectedDate);
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: CardInput(
                      icon: Icons.timer,
                      textFirst: 'トレーニング終了時間',
                      textSecond: model.dateFormat.format(model.selectedFinishDate),
                      onTap: () {
                        showDateTimeDialogSecond(context,
                            onSelectedSecondDate: (selectedDate) {
                              model.selectedFinishDate = selectedDate;
                            },
                            initialSecondDate: model.selectedFinishDate);
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text('トレーニング内容入力',style: TextStyle(fontSize: 25),),
                    ),
                  ),
                  SizedBox(height: 10,),
                  ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: TrainingMenuCard(),
                        ),
                      );
                    },
                    itemCount: model.indexNumber,
                  ),
                ],
              ),
            ),
            floatingActionButton: Column(
              verticalDirection: VerticalDirection.up,
              children: [
                FloatingActionButton(
                  heroTag: 'hero1',
                    child: Icon(Icons.add),
                    onPressed: () async {
                      await model.indexNumber++;
                      print(model.indexNumber);
                    }),
                SizedBox(height: 10,),
                FloatingActionButton(onPressed: (){
                  //todo
                },
                child: Icon(Icons.print),),
              ],
            ),
          );
        }));
  }
}
