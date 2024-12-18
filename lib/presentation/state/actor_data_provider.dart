import 'package:actor_quiz_app/application/usecase/actor_usecase.dart';
import 'package:actor_quiz_app/application/usecase/answer_usecase.dart';
import 'package:actor_quiz_app/domain/entities/actor.dart';
import 'package:actor_quiz_app/domain/usecase/actor_usecase_interface.dart';
import 'package:actor_quiz_app/domain/usecase/answer_usecase_interface.dart';
import 'package:actor_quiz_app/presentation/state/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'actor_data_provider.g.dart';

@riverpod
Future<Actor?> actorData(ActorDataRef ref) async {
  final pref = ref.watch(sharedPreferencesProvider);
  ActorUseCaseInterface actorUseCase = ActorUseCaseImpl();
  AnswerUserCaseInterface answerUseCase = AnswerUseCaseImpl(pref: pref);
  final int? answerType = answerUseCase.getAnswerType(pref);
  final List<String>? answerList = answerUseCase.fetchAnswerList();
  return await actorUseCase.fetchActorData(answerType ?? 4, answerList);
}
