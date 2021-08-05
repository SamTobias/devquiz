import 'dart:convert';

class UserModel {
  final String name;
  final String avatarUrl;
  final int score;

  UserModel({required this.name, required this.avatarUrl, required this.score});

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "avatarUrl": this.avatarUrl,
      "score": this.score,
    };
  }

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return new UserModel(
      name: map['name'] as String,
      avatarUrl: map['avatarUrl'] as String,
      score: map['score'] as int,
    );
  }
}