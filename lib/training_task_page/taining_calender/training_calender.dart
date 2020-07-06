import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trainngtaskcalcapp/training_task_page/model/trainig_task_model.dart';

class TrainingCalender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TrainingTaskModel>(builder: (context, model, child) {
     /* final training=model.training;
      final listTiles=training
          .map((workout) => ListTile(
        title: Text(workout.menu),
      ),
    );*/
      return Container(
        child: TableCalendar(
          events: model.events,
          initialCalendarFormat: CalendarFormat.week,
          calendarController: model.calendarController,
          onDaySelected: model.onDaySelected,
          builders:CalendarBuilders(
            selectedDayBuilder: (context, date, training) => Container(
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  date.day.toString(),
                  style: TextStyle(color: Colors.white),
                )),
            todayDayBuilder: (context, date, training) => Container(
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  date.day.toString(),
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ),
        );
    });
  }
}
