import 'package:flutter/material.dart';

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
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            ElevatedButton(
              child: const Text('MY BOOKINGS'),
              onPressed: () {},
            ),
            const Spacer(),
            ElevatedButton(
              child: const Text('MAKE A BOOKING'),
              onPressed: () {},
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('CREATE MATCH'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('UPDATE MATCH'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('CREATE VENUE'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('DELETE VENUE'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
