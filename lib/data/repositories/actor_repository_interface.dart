import '../models/actor_model.dart';

abstract class ActorRepositoryInterFace {
  Future<PopularActorModel> fetchPopularActorDataList();
  Future<ActorResult>? fetchActorData();
}
