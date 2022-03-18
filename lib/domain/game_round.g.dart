// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_round.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameRound _$GameRoundFromJson(Map<String, dynamic> json) => GameRound(
      (json['players'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['expense'] as int,
      json['currentPlayerIndex'] as int,
      json['currentTotalEarnings'] as int,
    );

Map<String, dynamic> _$GameRoundToJson(GameRound instance) => <String, dynamic>{
      'players': instance.players.map((e) => e.toJson()).toList(),
      'expense': instance.expense,
      'currentPlayerIndex': instance.currentPlayerIndex,
      'currentTotalEarnings': instance.currentTotalEarnings,
    };
