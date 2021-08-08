import 'package:dev_quiz/challenge/widgets/answer/answer_widget.dart';
import 'package:dev_quiz/challenge/widgets/quiz/quiz_controller.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;

  const QuizWidget({Key? key, required this.question}) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int answerIndexSelected = -1;
  final controller = QuizController();

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final answers = widget.question.answers;
    return Container(
      child: Column(
        children: [
          Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.question.title,
                  style: AppTextStyles.heading,
                )),
          ),
          SizedBox(height: 24),
          for (var i = 0; i < answers.length; i++)
            AnswerWidget(
              answer: answers[i],
              isSelected: answerIndexSelected == i,
              onTap: () {
                if (answerIndexSelected < 0) {
                  setState(() {
                    answerIndexSelected = i;
                  });
                }
              },
            )
        ],
      ),
    );
  }
}
