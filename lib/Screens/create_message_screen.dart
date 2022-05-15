import 'package:flutter/material.dart';
import '../Services/message_services.dart';


class CreateMessageScreen extends StatelessWidget {
  const CreateMessageScreen(this.userTo, this.name, {Key? key}) : super(key: key);
  final int userTo;
  final String name;

  @override
  Widget build(BuildContext context) {
    var myController = TextEditingController();
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
               TextField(
                  maxLines:null,
                controller: myController,
                decoration: const InputDecoration(
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
                      MessageServices.send(userTo, myController.text);
                      Navigator.pop(context);
                      Navigator.pop(context);
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
