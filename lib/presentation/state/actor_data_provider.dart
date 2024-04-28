import 'package:actor_quiz_app/application/usecase/actor_usecase.dart';
import 'package:actor_quiz_app/domain/entities/actor.dart';
import 'package:actor_quiz_app/domain/repository/answer_repository_interface.dart';
import 'package:actor_quiz_app/domain/usecase/actor_usecase_interface.dart';
import 'package:actor_quiz_app/infrastructure/repositories/answer_repository.dart';
import 'package:actor_quiz_app/presentation/state/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'actor_data_provider.g.dart';

@riverpod
Future<Actor?> actorData(ActorDataRef ref) async {
  final pref = ref.watch(sharedPreferencesProvider);
  ActorUseCaseInterface actorUseCase = ActorUseCaseImpl();
  AnswerRepositoryInterface answerUseCase = AnswerRepositoryImpl();
  final int? answerType = answerUseCase.getAnswerType(pref);
  //TODO: Answer用のモデルを定義してAnswerListをjsonDecodeして扱うようにリファクタリングする
  //resultItemから一個づつ繰り返しながら、中身のアイテムを取ってくる。それぞれのItemをJsonDecodeしてidが同一のものがある場合は
  final List<String>? answerList = answerUseCase.fetchAnswerList(pref);
  return await actorUseCase.fetchActorData(answerType ?? 4, answerList);
}
