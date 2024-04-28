import 'dart:convert';

import 'package:actor_quiz_app/core/extension/shared_preference_key_extension.dart';
import 'package:actor_quiz_app/domain/repository/answer_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnswerRepositoryImpl implements AnswerRepositoryInterface {
  @override
  void setAnswerType(int flg, SharedPreferences pref) {
    pref.setInt(SharedPreferenceKey.answerType.key, flg);
  }

  @override
  int? getAnswerType(SharedPreferences pref) {
    return pref.getInt(SharedPreferenceKey.answerType.key);
  }

  @override
  void addAnswer(Object answer, SharedPreferences pref) {
    final answerString = jsonEncode(answer).toString();
    List<String> answerList =
        pref.getStringList(SharedPreferenceKey.answerList.key) ?? [];
    answerList.add(answerString);
    pref.setStringList(SharedPreferenceKey.answerList.key, answerList);
  }

  @override
  List<String>? fetchAnswerList(SharedPreferences pref) {
    List<String>? answerList =
        pref.getStringList(SharedPreferenceKey.answerList.key);
    return answerList;
  }

  @override
  int? fetchAnswerLength(SharedPreferences pref) {
    List<String>? answerList =
        pref.getStringList(SharedPreferenceKey.answerList.key);
    return answerList?.length;
  }

  @override
  void initializeAnswer(SharedPreferences pref) {
    pref.setStringList(SharedPreferenceKey.answerList.key, []);
  }
}
