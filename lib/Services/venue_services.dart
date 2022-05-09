import 'dart:convert';
import 'package:tests/Services/globals.dart';
import 'package:http/http.dart' as http;

class VenueServices {
  static Future<http.Response> create(String name, String address) async {

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

    return response;
  }

  static Future<http.Response> delete(int id) async {

    var url = Uri.parse(baseURL + 'venue/' + id.toString());
    var headers = await getMeHeaders();

    http.Response response = await http.delete(
      url,
      headers: headers
    );

    return response;
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