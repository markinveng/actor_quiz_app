import 'package:actor_quiz_app/domain/repository/answer_repository_interface.dart';
import 'package:actor_quiz_app/domain/usecase/answer_usecase_interface.dart';
import 'package:actor_quiz_app/infrastructure/repositories/answer_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnswerUseCaseImpl implements AnswerUserCaseInterface {
  AnswerUseCaseImpl({required this.pref});

  final SharedPreferences pref;
  final AnswerRepositoryInterface answerRepository = AnswerRepositoryImpl();
  @override
  void addAnswer(Object answer) {
    answerRepository.addAnswer(answer, pref);
  }

  @override
  List<String>? fetchAnswerList() {
    return answerRepository.fetchAnswerList(pref);
  }

  @override
  int? fetchAnswerLength() {
    return answerRepository.fetchAnswerLength(pref);
  }

  @override
  void initializeAnswer() {
    return answerRepository.initializeAnswer(pref);
  }
}
