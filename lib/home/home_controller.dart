import 'package:dev_quiz/home/home_repository.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  final repository = HomeRepository();

  set state(HomeState state) => stateNotifier.value = state;

  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;
  void loadData() async {
    state = HomeState.loading;

    user = await repository.getUser();
    quizzes = await repository.getQuizzes();

    state = HomeState.success;
  }
}
