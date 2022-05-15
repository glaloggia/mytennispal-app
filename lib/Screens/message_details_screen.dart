import 'package:flutter/material.dart';
import 'package:tests/Screens/create_message_screen.dart';
import 'package:tests/Services/message_parser.dart';


class MessageDetailsScreen extends StatelessWidget {
  final MessageParser aMessage;

  const MessageDetailsScreen(this.aMessage, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var messageFrom = aMessage.name;
    var messageContent = aMessage.content;
    return Scaffold(
            appBar: AppBar(
              title: Text('myTennisPal - Message from $messageFrom'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Spacer(),
                  const Text("Message:"),
                  const Spacer(),
                  Container(child: Text(messageContent),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        child: const Text('Reply'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CreateMessageScreen(aMessage.userFrom,aMessage.name)),
                          );
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