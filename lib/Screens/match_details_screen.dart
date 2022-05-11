import 'package:flutter/material.dart';
import 'package:tests/Screens/create_match_date_screen.dart';
import 'package:tests/Services/match_services.dart';

class MatchDetailsScreen extends StatelessWidget {
  final MatchParser aMatch;

  const MatchDetailsScreen(this.aMatch, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
            appBar: AppBar(
              title: const Text('myTennisPal - Details from the match'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text('PENDING TO DEFINE'),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('CANCEL'),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(),
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