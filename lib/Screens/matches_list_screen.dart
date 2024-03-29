import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tests/Screens/match_details_screen.dart';
import 'package:tests/Screens/matches_screen.dart';
import 'package:tests/Services/match_services.dart';


class MatchesListScreen extends StatefulWidget {
  const MatchesListScreen({Key? key}) : super(key: key);

  @override
  _MatchesListScreenState createState() => _MatchesListScreenState();
}

class _MatchesListScreenState extends State<MatchesListScreen> {
  late Future<List<dynamic>> futureMatches;

  @override
  void initState() {
    super.initState();
    futureMatches = MatchServices.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('myTennisPal - Matches List'),
      ),
      body: Center(
        child: FutureBuilder<List<dynamic>>(
            future: futureMatches,
            builder: (context, snapShot) {
              switch(snapShot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                default:
                  return ListView.separated(
                    itemCount: snapShot.data!.length,
                    itemBuilder: (context, index) {
                      MatchParser aMatch = MatchParser.fromJson(snapShot.data![index]);
                      var eventDate = aMatch.eventDate;
                      var venueName = aMatch.venueName;
                      var matchId = aMatch.id.toString();
                      return ListTile(
                          leading: Text("Event #: $matchId"),
                          title: Text("Date and Time: $eventDate"),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              size: 20.0,
                              color: Colors.brown[900],
                            ),
                            onPressed: () {
                              MatchServices.delete(context, aMatch.id);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) =>
                                const MatchesScreen())
                              );
                            },),
                          subtitle: Text('Venue: $venueName'),
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MatchDetailsScreen(aMatch))
                              );
                            }
                            );
                          }
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