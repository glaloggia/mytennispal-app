import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tests/Services/globals.dart';

class UserServices {

  static Future<List<dynamic>> getRanking() async {
    var headers = await getMeHeaders();

    final response = await http
        .get(Uri.parse(baseURL + 'ranking'),
        headers: headers);

    if (response.statusCode == 200) {
      var responseBody = response.body;
      List<dynamic> itemsList = jsonDecode(responseBody);
      return itemsList;
    } else {
      throw Exception('Failed to load Ranking');
    }
  }
}

class UserParser {
  final int id;
  final String name;

  const UserParser({
    required this.id,
    required this.name
  });

  factory UserParser.fromJson(Map<String, dynamic> json) {
    return UserParser(
      id: json['id'] as int,
      name: json['name'] as String
    );
  }
}

class RankingParser{
  final int position;
  final String name;
  final int wins;

  const RankingParser({
    required this.position,
    required this.name,
    required this.wins
  });

  factory RankingParser.fromJson(Map<String, dynamic> json){
    return RankingParser(
      position: json['Position'] as int,
      name: json['name'] as String,
      wins: json['Wins'] as int
    );
  }

}