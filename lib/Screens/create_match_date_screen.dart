import 'package:flutter/material.dart';
import 'package:tests/Services/match_services.dart';
import 'package:tests/Services/venue_services.dart';

class CreateMatchDateScreen extends StatefulWidget {

  final VenueParser aVenue;

  const CreateMatchDateScreen(this.aVenue, {Key? key}) : super(key: key);

  @override
  _CreateMatchDateScreenState createState()
  {
    return _CreateMatchDateScreenState();
  }
}

class _CreateMatchDateScreenState extends State<CreateMatchDateScreen> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: const Text('myTennisPal - New Match'),
      ),
      body: Align(
        alignment: Alignment.center,
        child:
        Column(
          children: [
            const Spacer(),
            const Text('SELECT A DATE:'),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: const Text("Choose Date"),
              ),
            const Spacer(),
            Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                _selectTime(context);
              },
              child: const Text("Choose Time"),
            ),
            const Spacer(),
            Text(selectedTime.format(context)),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                String fullDate = selectedDate.year.toString() + '-' + selectedDate.month.toString() + '-'
                    + selectedDate.day.toString() + ' ' + selectedTime.hour.toString() + ':' + selectedTime.minute.toString()
                    + ':00';
                MatchServices.create(widget.aVenue.id, fullDate);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('CREATE MATCH'),
            ),
          const Spacer(),
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(2025),
    );

    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,

    );
    if(timeOfDay != null && timeOfDay != selectedTime)
    {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
}
