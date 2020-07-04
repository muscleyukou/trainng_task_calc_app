
import 'package:flutter/material.dart';
import 'package:trainngtaskcalcapp/page/calc_volume.dart';
import 'package:trainngtaskcalcapp/page/compare_max.dart';
import 'package:trainngtaskcalcapp/training_task_page/page/trainig_task.dart';

class HomeScreenModel extends ChangeNotifier{
  int _currentIndex =0;
  get currentIndex=>_currentIndex;
  set currentIndex(int index){
    _currentIndex=index;
    notifyListeners();
  }
  List pageList = [
    TrainingTask(),
    CalcVolume(),
    CompareMax(),
  ];
}