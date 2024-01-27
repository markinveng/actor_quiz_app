import '../models/actor_model.dart';

abstract class ActorDataSourceInterFace {
  Future<PopularActorModel> fetchPopularActorDataList();
  Future<ActorResult>? fetchActorData();
}
