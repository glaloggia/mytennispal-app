import 'package:flutter/material.dart';
import 'package:tests/Screens/matches_screen.dart';
import '../Services/venue_services.dart';


class CreateVenueScreen extends StatelessWidget {
  const CreateVenueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var myNameController = TextEditingController();
    var myAddressController = TextEditingController();
    return  Scaffold(
      appBar: AppBar(
        title: const Text('myTennisPal - New Venue'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Spacer(),
              const Text("Name:"),
               TextField(
                  maxLines:null,
                controller: myNameController,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.blue),
                    hintText: "Input the name:"
                ),
              ),
              const Spacer(),
              const Spacer(),
              const Text("Address:"),
               TextField(
                  maxLines:null,
                controller: myAddressController,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.blue),
                    hintText: "Input the address:"
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                    child: const Text('Create'),
                    onPressed: () {
                      VenueServices.create(myNameController.text, myAddressController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MatchesScreen()),
                      );
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
