import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('myTennisPal - Messages'),
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
              child: const Text('MESSAGES LIST'),
              onPressed: () {},
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('SEND MESSAGE'),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
