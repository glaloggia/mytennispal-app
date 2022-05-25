import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

// const String baseURL = "http://10.0.2.2:8000/api/"; //emulator localhost
const String baseURL = "http://127.0.0.1:8000/api/"; //WEB localhost

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 2),
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

Future<int> getMeUserId() async {

  dynamic output = await FlutterSession().get('userId');

  int userId = output;

  return userId;

}
