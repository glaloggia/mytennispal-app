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