import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/actor.dart';

part 'actor_model.freezed.dart';
part 'actor_model.g.dart';

@freezed
abstract class PopularActorModel with _$PopularActorModel {
  @JsonSerializable(explicitToJson: true)
  const PopularActorModel._();
  const factory PopularActorModel.request({
    required int page,
    required List<ActorResult>? results,
  }) = PopularActorModelRequest;
  const factory PopularActorModel.response({
    required int page,
    required List<ActorResult>? results,
  }) = PopularActorModelResponse;

  factory PopularActorModel.fromJson(Map<String, dynamic> json) =>
      _$PopularActorModelFromJson(json);

  ActorEntity toEntity() => ActorEntity(id: results?[0].id ?? 0, name: results?[0].name ?? "", profilePath: results?[0].profilePath ?? "", gender: results?[0].gender ?? 0);
}

@freezed
abstract class ActorResult with _$ActorResult {
  @JsonSerializable(explicitToJson: true)
  const factory ActorResult({
    @JsonKey(name: 'id') required int? id,
    @JsonKey(name: 'name') required String? name,
    @JsonKey(name: 'gender') required int? gender,
    @JsonKey(name: 'profile_path') required String? profilePath,
  }) = _ActorResult;
  factory ActorResult.fromJson(Map<String, dynamic> json) =>
      _$ActorResultFromJson(json);
}
