import 'package:flutter/material.dart';
import 'package:tests/Screens/matches_list_screen.dart';
import 'package:tests/Screens/rsvps_list_screen.dart';
import 'package:tests/Screens/venues_list_screen.dart';

import 'create_match_screen.dart';
import 'create_rsvp_screen.dart';
import 'create_venue_screen.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('myTennisPal - Matches'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              child: const Text('MY BOOKINGS'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RsvpsListScreen()),
                );
              },
            ),
            const Spacer(),
            ElevatedButton(
              child: const Text('MAKE A BOOKING'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateRsvpScreen()),
                );
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateMatchScreen()),
                );
              },
              child: const Text('CREATE MATCH'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MatchesListScreen()),
                );
              },
              child: const Text('MATCHES LIST'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateVenueScreen()),
                );
              },
              child: const Text('CREATE VENUE'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VenuesListScreen()),
                );
              },
              child: const Text('VENUES LIST'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
