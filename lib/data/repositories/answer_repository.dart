import 'dart:convert';

import 'package:actor_quiz_app/data/repositories/answer_reoisitory_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnswerRepository implements AnswerRepositoryInterface {
  AnswerRepository({required this.pref});
  final SharedPreferences pref;
  @override
  void addAnswer(Object answer) {
    final answerString = jsonEncode(answer).toString();
    List<String> answerList = pref.getStringList('answer') ?? [];
    answerList.add(answerString);
    pref.setStringList('answer', answerList);
  }

  List<String>? fetchAnswerList() {
    List<String>? answerList = pref.getStringList('answer');
    return answerList;
  }

  int? fetchAnswerLength() {
    List<String>? answerList = pref.getStringList('answer');
    return answerList?.length;
  }

  void initializeAnswer() {
    pref.setStringList('answer', []);
  }
}
