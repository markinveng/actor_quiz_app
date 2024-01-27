import 'package:actor_quiz_app/application/repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/actor_model.dart';
part 'popular_actor_list_provider.g.dart';

@riverpod
Future<PopularActorModel> popularActorList(PopularActorListRef ref) async {
  final repository = ref.read(actorRepositoryProvider);
  return await repository.fetchPopularActorDataList();
}