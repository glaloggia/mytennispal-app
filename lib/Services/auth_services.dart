import 'dart:convert';

import 'package:tests/Services/globals.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static Future<http.Response> register(
      String name, String email, String password) async {
    Map data = {
      "name": name,
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/register');
    var headers = await getMeHeaders();
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/login');
    var headers = await getMeHeaders();
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    return response;
  }
}
