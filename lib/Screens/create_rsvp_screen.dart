import 'package:flutter/material.dart';
import 'package:tests/Screens/matches_list_screen.dart';

class CreateRsvpScreen extends StatelessWidget {
  const CreateRsvpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: const Text('myTennisPal - New booking'),
      ),
      body: Align(
        alignment: Alignment.center,
        child:
        Column(
          children: [
            const Spacer(),
            const Spacer(),
            const Text('SELECT AN EVENT:'),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MatchesListScreen()),
                );
              },
              child: const Text('EVENTS LIST'),
            ),
          const Spacer(),
          const Spacer(),
          ],
        ),
      ),
    );
  }
}
