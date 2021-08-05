import 'dart:convert';

import 'package:dev_quiz/shared/models/answer_model.dart';

class QuestionModel {
  final String title;
  final List<AnswerModel> answers;

  QuestionModel({required this.title, required this.answers})
      : assert(answers.length == 4);

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return new QuestionModel(
      title: map['title'] as String,
      answers: List<AnswerModel>.from(map['answers']?.map((answer) => AnswerModel.fromMap(answer))),
    );
  }

  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source));
}
