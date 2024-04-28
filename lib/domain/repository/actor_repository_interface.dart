import 'package:actor_quiz_app/domain/entities/actor.dart';

abstract class ActorRepositoryInterFace {
  Future<Actor?> fetchActorData(int randomId);
  Future<List<Actor>?> fetchPopularActorDataList(int randomId);
}
