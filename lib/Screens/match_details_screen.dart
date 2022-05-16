import 'package:flutter/material.dart';
import 'package:tests/Screens/matches_screen.dart';
import 'package:tests/Services/match_services.dart';
import 'package:tests/Services/rsvp_services.dart';

import '../Services/globals.dart';


class MatchDetailsScreen extends StatelessWidget {
  final MatchParser aMatch;

  MatchDetailsScreen(this.aMatch, {Key? key}) : super(key: key);

  var futureId = getMeUserId();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
            appBar: AppBar(
              title: const Text('myTennisPal - Details from the match'),
              automaticallyImplyLeading: false,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Spacer(),
                  FutureBuilder<int>(
                      future: futureId,
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                          return ElevatedButton(
                            child: const Text('BOOK A PLACE'),
                            onPressed: () {
                              RsvpServices.create(context, snapshot.data, aMatch.id);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const MatchesScreen()),
                              );
                          },
                        );
                      }
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('BACK TO THE LIST'),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      Spacer(),
                    ],
                  ),
                  const Spacer(),
                  const Spacer(),
                ],
              ),
            ),
          );
  }
}