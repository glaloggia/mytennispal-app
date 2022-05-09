import 'dart:convert';
import 'package:tests/Services/globals.dart';
import 'package:http/http.dart' as http;

class MessageServices {
  static Future<http.Response> send(int userFrom, int userTo, String content) async {
    Map data = {
      "userFrom": userFrom,
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
}