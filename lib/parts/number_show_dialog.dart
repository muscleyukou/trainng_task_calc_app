import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:trainngtaskcalcapp/training_task_page/model/trainig_task_model.dart';

// ignore: must_be_immutable
class NumberShowDialog extends StatelessWidget {
  NumberShowDialog({this.initialValue,this.maxValue,this.minValue,this.onChanged});
 int initialValue;
 int minValue;
 int maxValue;
 ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
       return Consumer<TrainingTaskModel>(
         builder: (context, model,child) {
           return NumberPicker.integer(
               initialValue: initialValue,
               minValue: minValue,
               maxValue: maxValue,
           onChanged: onChanged,);
           }
       );
         }
}
