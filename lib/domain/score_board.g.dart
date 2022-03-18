// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScoreBoard _$ScoreBoardFromJson(Map<String, dynamic> json) => ScoreBoard(
      (json['players'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['playerScoreMap'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => Score.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$ScoreBoardToJson(ScoreBoard instance) =>
    <String, dynamic>{
      'players': instance.players.map((e) => e.toJson()).toList(),
      'playerScoreMap': instance.playerScoreMap
          .map((k, e) => MapEntry(k, e.map((e) => e.toJson()).toList())),
    };
