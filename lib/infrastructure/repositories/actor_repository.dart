import 'dart:convert';

import 'package:actor_quiz_app/core/env/env.dart';
import 'package:actor_quiz_app/core/exception/exception.dart';
import 'package:actor_quiz_app/domain/entities/actor.dart';
import 'package:actor_quiz_app/domain/repository/actor_repository_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ActorRepositoryImpl implements ActorRepositoryInterFace {
  @override
  Future<List<Actor>?> fetchPopularActorDataList(int randomId) async {
    try {
      final response = await http.get(Uri.parse("https://api.themoviedb.org/3/person/popular?page=$randomId&api_key=${Env.key}"));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)["results"];
        return jsonData.map<Actor>((data) => Actor.fromJson(data)).toList();
      } else {
        debugPrint('Fail to fetchPopularActorData in actor_repository.dart');
        return null;
      }
    } on Exception {
      debugPrint('Fail to fetchPopularActorData in actor_repository.dart');
      throw ServerException();
    }
  }

  @override
  Future<Actor?> fetchActorData(int randomId) async {
    try {
      final queryParameters = {
        "api_key": Env.key,
      };
      final response = await http.get(
        Uri.https('api.themoviedb.org', '/3/person/$randomId', queryParameters),
      );
      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return Actor.fromJson(responseData);
      } else {
        return null;
      }
    } catch (error) {
      debugPrint('Fail to fetchActorData in actor_repository.dart');
      throw ServerException();
    }
  }
}
