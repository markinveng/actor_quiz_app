import '../value/actor_gender.dart';

class ActorEntity {
  final int? id; // 識別ID
  final String? name; // 名前
  final int? gender; // 性別
  final String? profilePath;

  ActorEntity({
    required this.id,
    required this.profilePath,
    required this.name,
    required this.gender,
  });
}
