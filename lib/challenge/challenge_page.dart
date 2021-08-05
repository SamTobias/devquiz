import 'package:dev_quiz/challenge/widgets/answer/answer_widget.dart';
import 'package:dev_quiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), child: SafeArea(child: QuestionIndicatorWidget())),
      body: Column(
        children: [
          Text("O aslmd  odfasodmi as domas ", style: AppTextStyles.heading),
          SizedBox(height: 24),
          AnswerWidget(title: "Isso é um exemplo de resposta bem grande para ver o tamanho", isSelected: true, isRight: true),
          AnswerWidget(title: "Isso é um exemplo de resposta bem grande para ver o tamanho", isSelected: true, isRight: true),
          AnswerWidget(title: "Isso é um exemplo de resposta bem grande para ver o tamanho", isSelected: true, isRight: true),
          AnswerWidget(title: "Isso é um exemplo de resposta bem grande para ver o tamanho", isSelected: true, isRight: true),
        ],
      ),
    );
  }
}