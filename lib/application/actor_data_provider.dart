import 'package:actor_quiz_app/application/repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/actor_model.dart';
part 'actor_data_provider.g.dart';

@riverpod
Future<ActorResult> actorData(ActorDataRef ref) async {
  final repository = ref.read(actorRepositoryProvider);
  return await repository.fetchActorData();
}