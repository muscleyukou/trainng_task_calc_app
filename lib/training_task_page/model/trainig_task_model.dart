
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_helpers/firebase_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trainngtaskcalcapp/parts/training.dart';
import "package:intl/intl.dart";



class TrainingTaskModel extends ChangeNotifier {
  DatabaseService<EventModel> eventDBS = DatabaseService<EventModel>("training",fromDS: (id,data)
  => EventModel.fromDS(id, data), toMap:(training) => training.toMap());
  CalendarController calendarController = CalendarController();
  NumberPicker decimalNumberPicker;
  EventModel event;
  DateTime eventDate;

  Map<DateTime, List<EventModel>> events;
  List<EventModel>selectedEvents;
  EventList<EventModel> markedDateMap = EventList<EventModel>();
  int _indexNumber=1;
  get indexNumber=>_indexNumber;
  set indexNumber(int index){
    _indexNumber=index;
    notifyListeners();
  }

  int _setWeightNumber=1;
  get setWeightNumber=>_setWeightNumber;
  set setWeightNumber(int index){
    _setWeightNumber=index;
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
    eventDate=DateTime.now();
    notifyListeners();
  }

  onDaySelected(date,training) {
    eventDate=date;
    selectedEvents=training;
    print(date);
    print(training);
    notifyListeners();
  }

  int _currentWeightIndex = 30;

  get currentWeightIndex => _currentWeightIndex;
  set currentWeightIndex(int index) {
    _currentWeightIndex = index;
    notifyListeners();
  }
  String trainingMenu='';
  Future inputMenu()async{
    if(trainingMenu.isEmpty){
      throw('タイトルを入力してください');
    }else{
      Firestore.instance.collection('training')
          .add({
        'menu':trainingMenu,
      });
    }
  }

}
