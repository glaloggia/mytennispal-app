import 'package:flutter/material.dart';
import 'package:tests/Services/venue_services.dart';

import 'create_match_date_screen.dart';

class VenueDetailsScreen extends StatelessWidget {
  final VenueParser aVenue;

  const VenueDetailsScreen(this.aVenue, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var venueId = aVenue.id;
    var venueName = aVenue.name;
    var venueAddress = aVenue.address;
    return Scaffold(
            appBar: AppBar(
              title: Text('myTennisPal - Details from $venueName'),
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
                    child: const Text('CANCEL'),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        child: const Text('DELETE VENUE'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed: () {
                          VenueServices.delete(context, venueId);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      ),
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