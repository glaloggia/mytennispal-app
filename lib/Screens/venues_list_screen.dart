import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tests/Screens/venue_details_screen.dart';
import 'package:tests/Services/venue_services.dart';

import '../Services/globals.dart';



Future<List<dynamic>> getList() async {

  var headers = await getMeHeaders();

  final response = await http
      .get(Uri.parse('http://localhost:8000/api/venue'),headers: headers);

  if (response.statusCode == 200) {
    var responseBody = response.body;
    List<dynamic> itemsList = jsonDecode(responseBody);
    return itemsList;
  } else {
    throw Exception('Failed to load venues');
  }
}

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
    futureVenues = getList();
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