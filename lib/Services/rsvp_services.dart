import 'dart:convert';
import 'package:tests/Services/globals.dart';
import 'package:http/http.dart' as http;

class RsvpServices {
  static Future<http.Response> create(int playerId, int eventId) async {

    Map data = {
      "playerId": playerId,
      "eventId": eventId
    };

    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'rsvp');
    var headers = await getMeHeaders();

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    return response;
  }

  static Future<http.Response> delete(int id) async {

    var url = Uri.parse(baseURL + 'rsvp/' + id.toString());
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
        .get(Uri.parse(baseURL + 'rsvp'),headers: headers);

    if (response.statusCode == 200) {
      var responseBody = response.body;
      List<dynamic> itemsList = jsonDecode(responseBody);
      return itemsList;
    } else {
      throw Exception('Failed to load Matches');
    }
  }
}

class RsvpParser {
  final int id;
  final int eventId;
  final int playerId;

  const RsvpParser({
    required this.id,
    required this.eventId,
    required this.playerId
  });

  factory RsvpParser.fromJson(Map<String, dynamic> json) {
    return RsvpParser(
      id: json['id'] as int,
      eventId: json['eventId'] as int,
      playerId: json['playerId'] as int
    );
  }
}