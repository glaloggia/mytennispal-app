import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tests/Services/globals.dart';
import 'package:http/http.dart' as http;

class VenueServices {
  static Future<http.Response> create(BuildContext context, String name, String address) async {

    Map data = {
      "name": name,
      "address": address
    };

    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'venue');
    var headers = await getMeHeaders();

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    var error = response.statusCode;
    if (response.statusCode != 200 && response.statusCode != 201 ) {
      errorSnackBar(context, 'Error $error, venue already exists!');
    }
    return response;
  }

  static Future<http.Response> delete(BuildContext context,int id) async {

    var url = Uri.parse(baseURL + 'venue/' + id.toString());
    var headers = await getMeHeaders();

    http.Response response = await http.delete(
      url,
      headers: headers
    );
    var error = response.statusCode;
    if (response.statusCode != 200 && response.statusCode != 204 ) {
      errorSnackBar(context, 'Error $error, venue is in use!');
    }
    return response;
  }

  static Future<List<dynamic>> getList() async {

    var headers = await getMeHeaders();

    final response = await http
        .get(Uri.parse(baseURL + 'venue'),headers: headers);

    if (response.statusCode == 200) {
      var responseBody = response.body;
      List<dynamic> itemsList = jsonDecode(responseBody);
      return itemsList;
    } else {
      throw Exception('Failed to load venues');
    }
  }

}


class VenueParser {
  final int id;
  final String name;
  final String address;

  const VenueParser({
    required this.id,
    required this.name,
    required this.address
  });

  factory VenueParser.fromJson(Map<String, dynamic> json) {
    return VenueParser(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['address'] as String
    );
  }
}