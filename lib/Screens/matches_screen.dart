import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('myTennisPal - Matches'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            ElevatedButton(
              child: const Text('MY BOOKINGS'),
              onPressed: () {},
            ),
            Spacer(),
            ElevatedButton(
              child: const Text('MAKE A BOOKING'),
              onPressed: () {},
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('CREATE MATCH'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('UPDATE MATCH'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('CREATE VENUE'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('DELETE VENUE'),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
