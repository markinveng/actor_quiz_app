import 'dart:async';

import 'package:actor_quiz_app/core/exception/exception.dart';
import 'package:actor_quiz_app/domain/entities/actor.dart';
import 'package:actor_quiz_app/domain/repository/actor_repository_interface.dart';
import 'package:actor_quiz_app/domain/usecase/actor_usecase_interface.dart';
import 'package:actor_quiz_app/infrastructure/repositories/actor_repository.dart';
import 'package:flutter/foundation.dart';

class ActorUseCaseImpl implements ActorUseCaseInterface {
  final ActorRepositoryInterFace _api = ActorRepositoryImpl();
  // @override
  // Future<PopularActorModel> fetchPopularActorDataList() async {
  //   try {
  //     final data = await _api.fetchPopularActorDataList();
  //     return data;
  //   } on Exception {
  //     debugPrint('Fail ActorData.');
  //     throw ServerException();
  //   }
  // }

  @override
  Future<Actor> fetchActorData() async {
    try {
      Actor? data;
      do {
        data = await _api.fetchActorData();
        await Future.delayed(
          const Duration(milliseconds: 100),
        );
      } while (data == null || data.profilePath == null);
      return data;
    } catch (e) {
      debugPrint('Fail to fetchActorData in actor_usecase.dart');
      throw ServerException();
    }
  }
}
