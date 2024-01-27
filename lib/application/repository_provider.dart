import 'package:actor_quiz_app/data/repositories/actor_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod
ActorRepository actorRepository(ActorRepositoryRef ref) => ActorRepository();


// final actorDataProvider =
//     FutureProvider.autoDispose<ActorResult>((ref) async {
//   final repository = ref.read(repositoryProvider);
//   return await repository.fetchActorData();
// });

