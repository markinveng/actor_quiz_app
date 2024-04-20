import 'dart:convert';

import 'package:actor_quiz_app/domain/repository/answer_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnswerRepositoryImpl implements AnswerRepositoryInterface {
  @override
  void addAnswer(Object answer, SharedPreferences pref) {
    final answerString = jsonEncode(answer).toString();
    List<String> answerList = pref.getStringList('answer') ?? [];
    answerList.add(answerString);
    pref.setStringList('answer', answerList);
  }

  @override
  List<String>? fetchAnswerList(SharedPreferences pref) {
    List<String>? answerList = pref.getStringList('answer');
    return answerList;
  }

  @override
  int? fetchAnswerLength(SharedPreferences pref) {
    List<String>? answerList = pref.getStringList('answer');
    return answerList?.length;
  }

  @override
  void initializeAnswer(SharedPreferences pref) {
    pref.setStringList('answer', []);
  }
}
