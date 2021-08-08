import 'dart:convert';

import 'package:dev_quiz/shared/models/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get levelParse =>
      {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionsAnswered;
  final String imagem;
  final Level level;

  QuizModel(
      {required this.title,
      required this.questions,
      this.questionsAnswered = 0,
      required this.imagem,
      required this.level});

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return new QuizModel(
      title: map['title'] as String,
      questions: List<QuestionModel>.from(map['questions']?.map((question) => QuestionModel.fromMap(question))),
      questionsAnswered: map['questionsAnswered'] as int,
      imagem: map['imagem'] as String,
      level: map['level'].toString().levelParse,
    );
  }

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source));
}
