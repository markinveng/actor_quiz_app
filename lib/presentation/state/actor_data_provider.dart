import 'package:actor_quiz_app/application/usecase/actor_usecase.dart';
import 'package:actor_quiz_app/domain/entities/actor.dart';
import 'package:actor_quiz_app/domain/usecase/actor_usecase_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'actor_data_provider.g.dart';

@riverpod
Future<Actor> actorData(ActorDataRef ref) async {
  final ActorUseCaseInterface actorUseCase = ActorUseCaseImpl();
  return await actorUseCase.fetchActorData();
}