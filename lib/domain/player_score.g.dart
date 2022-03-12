// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerScore _$PlayerScoreFromJson(Map<String, dynamic> json) => PlayerScore(
      Player.fromJson(json['player'] as Map<String, dynamic>),
      (json['scores'] as List<dynamic>)
          .map((e) => Score.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlayerScoreToJson(PlayerScore instance) =>
    <String, dynamic>{
      'player': instance.player.toJson(),
      'scores': instance.scores.map((e) => e.toJson()).toList(),
    };
