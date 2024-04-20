import 'package:actor_quiz_app/domain/entities/actor.dart';

abstract class ActorUseCaseInterface {
  Future<Actor> fetchActorData();
}