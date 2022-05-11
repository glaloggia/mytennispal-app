import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

const String baseURL = "http://127.0.0.1:8000/api/"; //emulator localhost
// const Map<String, String> headers = {"Content-Type": "application/json"};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}

okSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}

Future<Map<String, String>> getMeHeaders() async {

  dynamic token = await FlutterSession().get('token');

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  };

  return headers;

}
