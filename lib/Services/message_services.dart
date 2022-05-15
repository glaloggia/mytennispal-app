import 'dart:convert';
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
}