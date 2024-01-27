import 'package:actor_quiz_app/application/shared_preferences_provider.dart';
import 'package:actor_quiz_app/data/repositories/answer_repository.dart';
import 'package:actor_quiz_app/main.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'answer_list_provider.g.dart';

@riverpod
class AnswerList extends _$AnswerList {
  @override
  List build() {
    final pref = ref.read(sharedPreferencesProvider);
    final answerRepository = AnswerRepository(pref: pref);
    return answerRepository.fetchAnswerList() ?? [];
  }

  void addAnswer(Object result) {
    
  }

  @override
  void initialize() {
    state = [];
  }
}
