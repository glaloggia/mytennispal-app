import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tests/Services/globals.dart';
import 'package:http/http.dart' as http;

class MessageServices {
  static Future<http.Response> send(int userTo, String content) async {
    var myUserId = await getMeUserId();
    Map data = {
      "userFrom": myUserId,
      "userTo": userTo,
      "content": content,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'message');
    var headers = await getMeHeaders();
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    return response;
  }

  static Future<http.Response> delete(BuildContext context, int id) async {
    var url = Uri.parse(baseURL + 'message/' + id.toString());
    var headers = await getMeHeaders();

    http.Response response = await http.delete(
        url,
        headers: headers
    );
    var error = response.statusCode;
    if (response.statusCode != 200 && response.statusCode != 204) {
      errorSnackBar(context, 'Error $error, check with sysadmin');
    }
    return response;
  }
}
class MessageParser {
  final int id;
  final int userFrom;
  final int userTo;
  final String name;
  final String content;
  final String created_at;
  final String updated_at;

  const MessageParser({
    required this.id,
    required this.userFrom,
    required this.userTo,
    required this.name,
    required this.content,
    required this.created_at,
    required this.updated_at,
  });

  factory MessageParser.fromJson(Map<String, dynamic> json) {
    return MessageParser(
    id: json['id'] as int,
    userFrom: json['userFrom'] as int,
    userTo: json['userTo'] as int,
    name: json['name'] as String,
    content: json['content'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
    );
  }
}
