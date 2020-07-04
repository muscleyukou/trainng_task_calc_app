import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trainngtaskcalcapp/parts/training.dart';
import "package:intl/intl.dart";



class TrainingTaskModel extends ChangeNotifier {
  List<Training>training = [];

  Future fetchTraining() async {
    final docs = await Firestore.instance.collection('training').getDocuments();
    final training = docs.documents.map((doc) => Training(doc)).toList();
    this.training = training;
    notifyListeners();
  }

  CalendarController calendarController = CalendarController();
  NumberPicker decimalNumberPicker;
  Map<DateTime, List<dynamic>> events;
  List<dynamic>selectedEvents;
  int _indexNumber=1;
  get indexNumber=>_indexNumber;
  set indexNumber(int index){
    _indexNumber=index;
    notifyListeners();
  }


  DateTime _selectedDate = DateTime.now();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
 get selectedDate=>_selectedDate;
 set selectedDate(DateTime time){
   _selectedDate=time;
   notifyListeners();
 }

  DateTime _selectedFinishDate = DateTime.now();
  final DateFormat dateFinishFormat = DateFormat('yyyy-MM-dd HH:mm');
  get selectedFinishDate=>_selectedFinishDate;
  set selectedFinishDate(DateTime finishTime){
    _selectedFinishDate=finishTime;
    notifyListeners();
  }

  fetchCalender() {
    calendarController = CalendarController();
    events = {};
    selectedEvents = [];
    notifyListeners();
  }

  onDaySelected(DateTime day, List events) {
    print(day.toIso8601String());
  }

  int _currentWeightIndex = 30;

  get currentWeightIndex => _currentWeightIndex;
  set currentWeightIndex(int index) {
    _currentWeightIndex = index;
    notifyListeners();
  }

}
