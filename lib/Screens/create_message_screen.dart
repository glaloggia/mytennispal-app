import 'package:flutter/material.dart';
import 'package:tests/Services/message_parser.dart';


class CreateMessageScreen extends StatelessWidget {
  const CreateMessageScreen(this.aMessage, {Key? key}) : super(key: key);
  final MessageParser aMessage;

  @override
  Widget build(BuildContext context) {
    var name = aMessage.name;
    return  Scaffold(
      appBar: AppBar(
        title: Text('myTennisPal - New Message to $name'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Spacer(),
              const Text("Message:"),
              const TextField(
                  maxLines:null,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.blue),
                    hintText: "Input the message:"
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                    child: const Text('Send'),
                    onPressed: () {

                    },
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: (){
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
      ),
    );
  }
}
