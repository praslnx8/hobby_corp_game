// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      (json['players'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      ScoreBoard.fromJson(json['scoreBoard'] as Map<String, dynamic>),
      (json['gameRounds'] as List<dynamic>)
          .map((e) => GameRound.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'players': instance.players.map((e) => e.toJson()).toList(),
      'scoreBoard': instance.scoreBoard.toJson(),
      'gameRounds': instance.gameRounds.map((e) => e.toJson()).toList(),
    };
