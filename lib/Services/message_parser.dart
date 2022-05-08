
class MessageParser {
  final int userFrom;
  final int userTo;
  final String name;
  final String content;
  final String created_at;
  final String updated_at;

  const MessageParser({
    required this.userFrom,
    required this.userTo,
    required this.name,
    required this.content,
    required this.created_at,
    required this.updated_at,
  });

  factory MessageParser.fromJson(Map<String, dynamic> json) {
    return MessageParser(
      userFrom: json['userFrom'] as int,
      userTo: json['userTo'] as int,
      name: json['name'] as String,
      content: json['content'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );
  }
}