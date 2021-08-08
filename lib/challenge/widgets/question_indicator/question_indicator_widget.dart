import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentQuestion;
  final int amountOfQuestions;
  const QuestionIndicatorWidget({Key? key, required this.currentQuestion, required this.amountOfQuestions}) : assert(currentQuestion <= amountOfQuestions && amountOfQuestions > 0), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Questão $currentQuestion", style: AppTextStyles.body),
              Text("de $amountOfQuestions", style: AppTextStyles.body),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          ProgressIndicatorWidget(value: currentQuestion / amountOfQuestions)
        ],
      ),
    );
  }
}
