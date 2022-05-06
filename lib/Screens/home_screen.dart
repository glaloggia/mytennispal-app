import 'package:flutter/material.dart';

import 'matches_screen.dart';
import 'messages_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('myTennisPal'),
        automaticallyImplyLeading: false,
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
              child: const Text('MESSAGES'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MessagesScreen()),
                );
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MatchesScreen()),
                );
              },
              child: const Text('MATCHES'),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
