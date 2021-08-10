import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int rightAnswers;
  final int amountOfQuestions;

  const ResultPage({
    required this.title,
    required this.rightAnswers,
    required this.amountOfQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 130),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(rightAnswers > 0 ? AppImages.trophy : AppImages.error),
            Column(
              children: [
                Text(
                  rightAnswers > 0 ? "Parabéns" : "Que pena!",
                  style: AppTextStyles.heading40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Text.rich(
                    TextSpan(
                        text: "Você concluiu \n",
                        style: AppTextStyles.body,
                        children: [
                          TextSpan(text: title, style: AppTextStyles.bodyBold),
                          TextSpan(
                              text:
                                  "\n com $rightAnswers de $amountOfQuestions acertos",
                              style: AppTextStyles.body)
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                NextButtonWidget(
                  label: "Compartilhar",
                  isPrimary: true,
                  onTap: () => Share.share(
                      "DevQuiz NLW 5 - Flutter: Resultado do Quiz $title\nObtive $rightAnswers de $amountOfQuestions acertos"),
                ),
                SizedBox(height: 24),
                NextButtonWidget(
                  label: "Voltar ao início",
                  isPrimary: false,
                  onTap: () => Navigator.pop(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
