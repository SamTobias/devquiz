import 'package:dev_quiz/challenge/challenge_controller.dart';
import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:dev_quiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:dev_quiz/result/result_page.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  const ChallengePage({Key? key, required this.questions, required this.title})
      : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    controller.currentPageNotifier.addListener(() {
      setState(() {});
    });
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: SafeArea(
              top: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(),
                  ValueListenableBuilder<int>(
                      valueListenable: controller.currentPageNotifier,
                      builder: (context, value, _) => QuestionIndicatorWidget(
                          currentQuestion: controller.currentPage,
                          amountOfQuestions: widget.questions.length)),
                ],
              ))),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: widget.questions
            .map((question) => QuizWidget(
                question: question,
                onSelectAnswer: (isRight) {
                  if (isRight) controller.rightAnswers++;
                  if (!isLastQuestion()) nextQuestion();
                }))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => Expanded(
                        child: NextButtonWidget(
                      label: isLastQuestion() ? "Confirmar" : "Pular",
                      isPrimary: isLastQuestion(),
                      onTap: () =>
                          isLastQuestion() ? finishQuiz() : nextQuestion(),
                    )))
          ],
        ),
      ),
    );
  }

  bool isLastQuestion() => controller.currentPage == widget.questions.length;

  Future<void> nextQuestion() => pageController.nextPage(
      duration: Duration(milliseconds: 500), curve: Curves.ease);

  void finishQuiz() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ResultPage(
                  rightAnswers: controller.rightAnswers,
                  title: widget.title,
                  amountOfQuestions: widget.questions.length,
                )));
  }
}