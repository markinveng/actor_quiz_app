import 'dart:convert';
import 'dart:math';

import 'package:actor_quiz_app/core/env/env.dart';
import 'package:actor_quiz_app/core/exception/exception.dart';
import 'package:actor_quiz_app/domain/entities/actor.dart';
import 'package:actor_quiz_app/domain/repository/actor_repository_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ActorRepositoryImpl implements ActorRepositoryInterFace {
  @override
  // Future<PopularActorModel> fetchPopularActorDataList() async {
  //   final dio = Dio();
  //   const String uri = 'https://api.themoviedb.org/3/person/popular';

  //   //const String uri = 'https://api.themoviedb.org/3/person/12798';

  //   final String apiKey = '?api_key=${Env.key}';
  //   final String requestURL = uri + apiKey;
  //   try {
  //     final response = await dio.get(requestURL);
  //     final responseData = response.data;
  //     print(responseData);
  //     return PopularActorModel.fromJson(responseData);
  //   } on Exception {
  //     debugPrint('Fail ActorData.');
  //     throw ServerException();
  //   }
  // }

  @override
  Future<Actor?> fetchActorData() async {
    final int randomId = Random().nextInt(3287502) + 1;
    try {
      final queryParameters = {
        "api_key": '${Env.key}',
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
