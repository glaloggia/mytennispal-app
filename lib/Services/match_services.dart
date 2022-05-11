import 'dart:convert';
import 'package:tests/Services/globals.dart';
import 'package:http/http.dart' as http;

class MatchServices {
  static Future<http.Response> create(int venueId, String date) async {

    Map data = {
      "venueId": venueId,
      "eventDate": date
    };

    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'event');
    var headers = await getMeHeaders();

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    return response;
  }

  static Future<http.Response> delete(int id) async {

    var url = Uri.parse(baseURL + 'event/' + id.toString());
    var headers = await getMeHeaders();

    http.Response response = await http.delete(
      url,
      headers: headers
    );

    return response;
  }

  static Future<List<dynamic>> getList() async {

    var headers = await getMeHeaders();

    final response = await http
        .get(Uri.parse('http://localhost:8000/api/event'),headers: headers);

    if (response.statusCode == 200) {
      var responseBody = response.body;
      List<dynamic> itemsList = jsonDecode(responseBody);
      return itemsList;
    } else {
      throw Exception('Failed to load Matches');
    }
  }
}

class MatchParser {
  final int id;
  final int venueId;
  final String eventDate;
  final String venueName;

  const MatchParser({
    required this.id,
    required this.venueId,
    required this.eventDate,
    required this.venueName
  });

  factory MatchParser.fromJson(Map<String, dynamic> json) {
    return MatchParser(
      id: json['id'] as int,
      venueId: json['venueId'] as int,
      eventDate: json['eventDate'] as String,
      venueName: json['venueName'] as String
    );
  }
}