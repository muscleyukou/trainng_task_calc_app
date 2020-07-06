import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainngtaskcalcapp/parts/training_set_card.dart';
import 'package:trainngtaskcalcapp/training_task_page/model/trainig_task_model.dart';



class RecordWeightSet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TrainingTaskModel>(
      create: (context) => TrainingTaskModel(),
      child: Consumer<TrainingTaskModel>(
          builder: (context, model, child) {
            return Scaffold(
              appBar: AppBar(title: Text('重量とセットの登録')),
              body: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 230,
                          child: TrainingSetWeight(),
                        ),
                      );
                    },
                    itemCount: model.setWeightNumber,
                  ),

              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                  onPressed: () {
                    model.setWeightNumber++;
                  }),
            );
          }
      ),
    );
  }
}
