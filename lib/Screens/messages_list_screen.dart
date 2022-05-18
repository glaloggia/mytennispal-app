import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tests/Services/message_parser.dart';

import '../Services/globals.dart';
import 'message_details_screen.dart';

Future<List<dynamic>> getJSON() async {

  var headers = await getMeHeaders();

  final response = await http
      .get(Uri.parse(baseURL + 'message'),headers: headers);

  if (response.statusCode == 200) {
    var responseBody = response.body;
    List<dynamic> itemsList = jsonDecode(responseBody);
    return itemsList;
  } else {
    throw Exception('Failed to load messages');
  }
}

class MessagesListScreen extends StatefulWidget {
  const MessagesListScreen({Key? key}) : super(key: key);

  @override
  _MessagesListScreenState createState() => _MessagesListScreenState();
}

class _MessagesListScreenState extends State<MessagesListScreen> {
  late Future<List<dynamic>> futureMessages;

  @override
  void initState() {
    super.initState();
    futureMessages = getJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('myTennisPal - Inbox'),
        ),
        body: Center(
          child: FutureBuilder<List<dynamic>>(
              future: futureMessages,
              builder: (context, snapShot) {
                switch(snapShot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    return ListView.separated(
                      itemCount: snapShot.data!.length,
                      itemBuilder: (context, index) {
                        MessageParser aMessage = MessageParser.fromJson(snapShot.data![index]);
                        var name = aMessage.name;
                        var sent = aMessage.created_at;
                        return ListTile(
                          title: Text("From $name"),
                          subtitle: Text("Sent: $sent"),
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MessageDetailsScreen(aMessage))
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