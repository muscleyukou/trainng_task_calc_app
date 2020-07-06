import 'package:firebase_helpers/firebase_helpers.dart';

class EventModel extends DatabaseItem{
  final String id;
  final String menu;
  final String description;
  final DateTime trainingDate;

  EventModel({this.id,this.menu, this.description, this.trainingDate}):super(id);
  factory EventModel.fromMap(Map data) {
    return EventModel(
      menu: data['menu'],
      description: data['description'],
      trainingDate: data['trainingDate'],
    );
  }

  factory EventModel.fromDS(String id, Map<String,dynamic> data) {
    return EventModel(
      id: id,
      menu: data['menu'],
      description: data['description'],
      trainingDate: data['trainingDate'].toDate(),
    );
  }

  Map<String,dynamic> toMap() {
    return {
      "menu":menu,
      "description": description,
      "event_date":trainingDate,
      "id":id,
    };
  }

}