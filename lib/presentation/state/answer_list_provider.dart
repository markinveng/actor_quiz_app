import 'package:actor_quiz_app/application/usecase/answer_usecase.dart';
import 'package:actor_quiz_app/domain/usecase/answer_usecase_interface.dart';
import 'package:actor_quiz_app/presentation/state/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'answer_list_provider.g.dart';

@riverpod
class AnswerList extends _$AnswerList {
  @override
  List build() {
    final pref = ref.watch(sharedPreferencesProvider);
    final AnswerUserCaseInterface answerUseCase = AnswerUseCaseImpl(pref: pref);
    return answerUseCase.fetchAnswerList() ?? [];
  }

  void addAnswer(Object result) {
    
  }

  void initialize() {
    state = [];
  }
}
