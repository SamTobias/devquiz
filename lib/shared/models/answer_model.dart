import 'dart:convert';

class AnswerModel {
  final String title;
  final bool isRight;

  AnswerModel({required this.title, this.isRight = false});

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return new AnswerModel(
      title: map['title'] as String,
      isRight: map['isRight'] as bool? ?? false,
    );
  }

  factory AnswerModel.fromJson(String source) => AnswerModel.fromMap(json.decode(source));
}
