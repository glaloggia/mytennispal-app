import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:tests/Services/globals.dart';
import 'package:http/http.dart' as http;

class MatchServices {
  static Future<http.Response> create(int venueId, String date) async {

    Map data = {
      "venueId": venueId,
      "eventDate": date,
      "winnerId":0
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

  static Future<http.Response> delete(BuildContext context, int id) async {

    var url = Uri.parse(baseURL + 'event/' + id.toString());
    var headers = await getMeHeaders();

    http.Response response = await http.delete(
      url,
      headers: headers
    );
    var error = response.statusCode;
    if (response.statusCode != 200 && response.statusCode != 204 ) {
      errorSnackBar(context, 'Error $error, match has bookings already!');
    }
    return response;
  }

  static Future<List<dynamic>> getList() async {

    var headers = await getMeHeaders();

    final response = await http
        .get(Uri.parse(baseURL + 'event'),headers: headers);

    if (response.statusCode == 200) {
      var responseBody = response.body;
      List<dynamic> itemsList = jsonDecode(responseBody);
      return itemsList;
    } else {
      throw Exception('Failed to load Matches');
    }
  }

  static Future<void> updateWinner(int eventId,int userId) async {

    var venueId = await getVenueIdFromEvent(eventId);

    Map data = {
      "venueId": venueId,
      "winnerId": userId
    };

    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'event/' + eventId.toString());
    var headers = await getMeHeaders();

    http.Response response = await http.put(
      url,
      headers: headers,
      body: body,
    );

  }

  static Future<int> getVenueIdFromEvent(int eventId) async {

      int anEvent;

      var url = Uri.parse(baseURL + 'event/' + eventId.toString());
      var headers = await getMeHeaders();

      http.Response response = await http.get(
          url,
          headers: headers
      );
      var responseBody = response.body;

      anEvent = jsonDecode(responseBody)['venueId'];

      return anEvent;
  }

  static Future<MatchParser> getMeAnEvent(int eventId) async {

      var anEvent;

      var url = Uri.parse(baseURL + 'event/' + eventId.toString());
      var headers = await getMeHeaders();

      http.Response response = await http.get(
          url,
          headers: headers
      );
      var responseBody = response.body;

      anEvent = jsonDecode(responseBody);

      return MatchParser(id: anEvent['id'], venueId: anEvent['venueId'], winnerId: anEvent['winnerId'], eventDate: anEvent['eventDate'], venueName: anEvent['venueName']);
  }

}


class MatchParser {
  final int id;
  final int venueId;
  final int winnerId;
  final String eventDate;
  final String venueName;

  const MatchParser({
    required this.id,
    required this.venueId,
    required this.winnerId,
    required this.eventDate,
    required this.venueName
  });

  factory MatchParser.fromJson(Map<String, dynamic> json) {
    return MatchParser(
      id: json['id'] as int,
      venueId: json['venueId'] as int,
      winnerId: json['winnerId'] as int,
      eventDate: json['eventDate'] as String,
      venueName: json['venueName'] as String
    );
  }
}