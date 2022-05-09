import 'package:flutter/material.dart';

import 'messages_list_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('myTennisPal - Messages'),
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
              child: const Text('MESSAGES LIST'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const MessagesListScreen()),
                );
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
