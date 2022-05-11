import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tests/Screens/venue_details_screen.dart';
import 'package:tests/Services/venue_services.dart';


class VenuesListScreen extends StatefulWidget {
  const VenuesListScreen({Key? key}) : super(key: key);

  @override
  _VenuesListScreenState createState() => _VenuesListScreenState();
}

class _VenuesListScreenState extends State<VenuesListScreen> {
  late Future<List<dynamic>> futureVenues;

  @override
  void initState() {
    super.initState();
    futureVenues = VenueServices.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('myTennisPal - Venues List'),
        ),
        body: Center(
          child: FutureBuilder<List<dynamic>>(
              future: futureVenues,
              builder: (context, snapShot) {
                switch(snapShot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    return ListView.separated(
                      itemCount: snapShot.data!.length,
                      itemBuilder: (context, index) {
                        VenueParser aVenue = VenueParser.fromJson(snapShot.data![index]);
                        var name = aVenue.name;
                        return ListTile(
                          title: Text("Name: $name"),
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => VenueDetailsScreen(aVenue))
                              );
                              }
                            );
                          });
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    );
                }}),
        ),
    );
  }
}