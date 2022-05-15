import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tests/Screens/rsvps_attendance_screen.dart';
import 'package:tests/Services/rsvp_services.dart';


class RsvpsListScreen extends StatefulWidget {
  const RsvpsListScreen({Key? key}) : super(key: key);

  @override
  _RsvpsListScreenState createState() => _RsvpsListScreenState();
}

class _RsvpsListScreenState extends State<RsvpsListScreen> {
  late Future<List<dynamic>> futureRsvps;

  @override
  void initState() {
    super.initState();
    futureRsvps = RsvpServices.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('myTennisPal - my bookings'),
        ),
        body: Center(
          child: FutureBuilder<List<dynamic>>(
              future: futureRsvps,
              builder: (context, snapShot) {
                switch(snapShot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    return ListView.separated(
                      itemCount: snapShot.data!.length,
                      itemBuilder: (context, index) {
                        RsvpParser aRsvp = RsvpParser.fromJson(snapShot.data![index]);
                        var eventId = aRsvp.eventId;
                        return ListTile(
                          title: Text("Event Id: $eventId"),
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RsvpsAttendanceScreen(eventId))
                              );
                              }
                            );
                          });
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    );
                }}),
        ),
    );
  }
}