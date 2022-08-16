import 'package:flutter/material.dart';
import 'package:tests/Services/venue_services.dart';

import 'create_match_date_screen.dart';

class VenueDetailsScreen extends StatelessWidget {
  final VenueParser aVenue;

  const VenueDetailsScreen(this.aVenue, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var venueName = aVenue.name;
    var venueAddress = aVenue.address;
    return Scaffold(
            appBar: AppBar(
              title: Text('myTennisPal - Details from $venueName'),
              automaticallyImplyLeading: false,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Spacer(),
                  const Spacer(),
                  const Text("ADDRESS:"),
                  const Spacer(),
                  Container(child: Text(venueAddress),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                  ),
                  const Spacer(),
                  const Spacer(),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CreateMatchDateScreen(aVenue))
                      );
                    },
                    child: const Text('CREATE MATCH IN HERE'),
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
                      Spacer(),
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