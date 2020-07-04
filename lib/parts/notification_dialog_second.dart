import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<TimeOfDay> _selectTime(BuildContext context,
    {@required DateTime initialSecondDate}) {
  final now = DateTime.now();

  return showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: initialSecondDate.hour, minute: initialSecondDate.minute),
  );
}

Future<DateTime> _selectDateTime(BuildContext context,
    {@required DateTime initialSecondDate}) {
  final now = DateTime.now();
  final newestDate = initialSecondDate.isAfter(now) ? initialSecondDate : now;

  return showDatePicker(
    context: context,
    initialDate: newestDate.add(Duration(seconds: 1)),
    firstDate: now,
    lastDate: DateTime(2100),
  );
}

Dialog showDateTimeDialogSecond(
    BuildContext context, {
      @required ValueChanged<DateTime> onSelectedSecondDate,
      @required DateTime initialSecondDate,
    }) {
  final dialog = Dialog(
    child: DateTimeDialogSecond(
        onSelectedSecondDate: onSelectedSecondDate, initialSecondDate: initialSecondDate),
  );

  showDialog(context: context, builder: (BuildContext context) => dialog);
}

class DateTimeDialogSecond extends StatefulWidget {
  final ValueChanged<DateTime> onSelectedSecondDate;
  final DateTime initialSecondDate;

  const DateTimeDialogSecond({
    @required this.onSelectedSecondDate,
    @required this.initialSecondDate,
    Key key,
  }) : super(key: key);
  @override
  _DateTimeDialogSecondState createState() => _DateTimeDialogSecondState();
}

class _DateTimeDialogSecondState extends State<DateTimeDialogSecond> {
  DateTime selectedSecondDate;

  @override
  void initState() {
    super.initState();

    selectedSecondDate = widget.initialSecondDate;
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Select time',
          style: Theme.of(context).textTheme.title,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(DateFormat('yyyy-MM-dd').format(selectedSecondDate)),
              onPressed: () async {
                final date = await _selectDateTime(context,
                    initialSecondDate: selectedSecondDate);
                if (date == null) return;

                setState(() {
                  selectedSecondDate = DateTime(
                    date.year,
                    date.month,
                    date.day,
                    selectedSecondDate.hour,
                    selectedSecondDate.minute,
                  );
                });

                widget.onSelectedSecondDate(selectedSecondDate);
              },
            ),
            const SizedBox(width: 8),
            RaisedButton(
              child: Text(DateFormat('HH:mm').format(selectedSecondDate)),
              onPressed: () async {
                final time =
                await _selectTime(context, initialSecondDate: selectedSecondDate);
                if (time == null) return;

                setState(() {
                  selectedSecondDate = DateTime(
                    selectedSecondDate.year,
                    selectedSecondDate.month,
                    selectedSecondDate.day,
                    time.hour,
                    time.minute,
                  );
                });

                widget.onSelectedSecondDate(selectedSecondDate);
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        OutlineButton(
          child: Text('Schedule!'),
          onPressed: () {
            Navigator.of(context).pop();
          },
          highlightColor: Colors.orange,
        ),
      ],
    ),
  );
}