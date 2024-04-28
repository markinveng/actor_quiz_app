import 'dart:async';
import 'dart:math';

import 'package:actor_quiz_app/core/exception/exception.dart';
import 'package:actor_quiz_app/core/method/answer_method.dart';
import 'package:actor_quiz_app/domain/entities/actor.dart';
import 'package:actor_quiz_app/domain/repository/actor_repository_interface.dart';
import 'package:actor_quiz_app/domain/usecase/actor_usecase_interface.dart';
import 'package:actor_quiz_app/infrastructure/repositories/actor_repository.dart';
import 'package:flutter/foundation.dart';

class ActorUseCaseImpl implements ActorUseCaseInterface {
  final ActorRepositoryInterFace _api = ActorRepositoryImpl();
  @override
  Future<Actor>? fetchActorData(int answerType, List<String>? answerList) {
    switch (answerType) {
      case 1:
        return fetchRandomActorData(answerList);
      case 2:
        return fetchPopularActor(answerList);
      default:
        //TODO: アラートを表示して前画面に戻る(actorProviderは仮置き)
        return fetchPopularActor(answerList);
    }
  }

  Future<Actor>? fetchPopularActor(List<String>? answerList) async {
    try {
      List<Actor>? actorList;
      int randomId;
      bool? searchStatus;
      do {
        //10ページある俳優リストからランダムでページを選択
        actorList =
            await _api.fetchPopularActorDataList(Random().nextInt(10) + 1);
        if (actorList != null) {
          //
          randomId = Random().nextInt(actorList.length) + 1;
          searchStatus = searchConflict(actorList[randomId].id, answerList);
          if (!searchStatus) {
            return actorList[randomId];
          }
        }
      } while (actorList == null || searchStatus != true);
      return const Actor(id: 0, name: "", gender: 0, profilePath: "");
    } on Exception {
      debugPrint('Fail ActorData.');
      throw ServerException();
    }
  }

  Future<Actor> fetchRandomActorData(List<String>? answerList) async {
    try {
      Actor? data;
      do {
        data = await _api.fetchActorData(Random().nextInt(3287502) + 1);
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
