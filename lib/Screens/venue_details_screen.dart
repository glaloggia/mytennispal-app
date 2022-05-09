import 'package:flutter/material.dart';
import 'package:tests/Services/venue_services.dart';

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
                  const Text("Address:"),
                  const Spacer(),
                  Container(child: Text(venueAddress),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        child: const Text('Delete'),
                        onPressed: () {
                          VenueServices.delete(venueId);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
  }
}