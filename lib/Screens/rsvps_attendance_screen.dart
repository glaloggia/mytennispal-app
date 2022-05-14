import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tests/Screens/create_message_screen.dart';
import 'package:tests/Services/rsvp_services.dart';
import 'package:tests/Services/user_services.dart';


class RsvpsAttendanceScreen extends StatefulWidget {
  final int eventId;
  const RsvpsAttendanceScreen(this.eventId, {Key? key}) : super(key: key);

  @override
  _RsvpsAttendanceScreenState createState() => _RsvpsAttendanceScreenState();
}

class _RsvpsAttendanceScreenState extends State<RsvpsAttendanceScreen> {
  late Future<List<dynamic>> futureAttendance;

  @override
  void initState() {
    super.initState();
    futureAttendance = RsvpServices.getAttendance(widget.eventId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('myTennisPal - attendance'),
        ),
        body: Center(
          child: FutureBuilder<List<dynamic>>(
              future: futureAttendance,
              builder: (context, snapShot) {
                switch(snapShot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    return ListView.separated(
                      itemCount: snapShot.data!.length,
                      itemBuilder: (context, index) {
                        UserParser aUser = UserParser.fromJson(snapShot.data![index]);
                        var name = aUser.name;
                        return ListTile(
                          title: Text("Player Name: $name"),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.mail,
                              size: 20.0,
                              color: Colors.brown[900],
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CreateMessageScreen(aUser.id, aUser.name))
                              );
                            },
                          ),
                          );
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