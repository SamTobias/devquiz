import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz;

  const QuizCardWidget({Key? key, required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(quiz.imagem),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Text(
              quiz.title,
              overflow: TextOverflow.fade,
              style: AppTextStyles.heading15,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(flex: 1, child: Text("${quiz.questionsAnswered}/${quiz.question.length}", style: AppTextStyles.body11)),
              Expanded(
                flex: 4,
                child: ProgressIndicatorWidget(value: quiz.questionsAnswered / quiz.question.length),
              )
            ],
          )
        ],
      ),
    );
  }
}
