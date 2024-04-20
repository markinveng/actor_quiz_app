

import 'package:actor_quiz_app/domain/entities/actor.dart';

abstract class ActorRepositoryInterFace {
  //TODO: 有名俳優はActorDataListでモデルを作る
  //Future<PopularActorModel> fetchPopularActorDataList();
  Future<Actor?> fetchActorData();
}
