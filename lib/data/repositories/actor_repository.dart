import 'dart:async';

import 'package:actor_quiz_app/data/datasources/actor_datasouce.dart';
import 'package:actor_quiz_app/data/repositories/actor_repository_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../core/exception/exception.dart';
import '../models/actor_model.dart';

class ActorRepository implements ActorRepositoryInterFace {
  final _api = ActorDataSource();
  @override
  Future<PopularActorModel> fetchPopularActorDataList() async {
    try {
      final data = await _api.fetchPopularActorDataList();
      return data;
    } on Exception {
      debugPrint('Fail ActorData.');
      throw ServerException();
    }
  }

  @override
  Future<ActorResult> fetchActorData() async {
    try {
      var data = await _api.fetchActorData();
      for (int i = 0; i < 100; i++) {
        print(
          'id:${data.id}, name:${data.name}, gender:${data.gender}, profilePath:${data.profilePath}',
        );
        if (data.profilePath != null && data.name != null) break;
        await Future.delayed(
          const Duration(milliseconds: 1000),
        );
        data = await _api.fetchActorData();
      }
      return data;
    } catch (e) {
      throw ServerException();
    }
  }
}
