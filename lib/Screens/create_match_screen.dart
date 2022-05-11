import 'package:flutter/material.dart';
import 'package:tests/Screens/venues_list_screen.dart';

class CreateMatchScreen extends StatelessWidget {
  const CreateMatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: const Text('myTennisPal - New Match'),
      ),
      body: Align(
        alignment: Alignment.center,
        child:
        Column(
          children: [
            const Spacer(),
            const Spacer(),
            Text('SELECT A VENUE:'),
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
          const Spacer(),
          ],
        ),
      ),
    );
  }
}
