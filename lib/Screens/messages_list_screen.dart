import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getJSON() async {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer 37|1SZZdzVBNjij9gT1wAkxaPwyQbSdd7xQWGgzoHl8'
  };

  final response = await http
      .get(Uri.parse('http://localhost:8000/api/message'),headers: headers);

  if (response.statusCode == 200) {
    var responseBody = response.body;
    List<dynamic> itemsList = jsonDecode(responseBody);
    return itemsList;
  } else {
    throw Exception('Failed to load venues');
  }
}

class MessagesListScreen extends StatefulWidget {
  const MessagesListScreen({Key? key}) : super(key: key);

  @override
  _MessagesListScreenState createState() => _MessagesListScreenState();
}

class _MessagesListScreenState extends State<MessagesListScreen> {
  late Future<List<dynamic>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = getJSON();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<dynamic>>(
              future: futureAlbum,
              builder: (context, snapShot) {
                switch(snapShot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    return ListView.builder(
                      itemCount: snapShot.data!.length,
                      itemBuilder: (context, index) {
                        return Text(snapShot.data![index].toString());
                      },
                    );
                }}),
        ),
      ),
    );
  }
}