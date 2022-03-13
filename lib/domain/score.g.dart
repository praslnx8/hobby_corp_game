// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Score _$ScoreFromJson(Map<String, dynamic> json) => Score(
      json['earning'] as int,
      json['profit'] as int,
      json['totalEarning'] as int,
      json['totalProfit'] as int,
    );

Map<String, dynamic> _$ScoreToJson(Score instance) => <String, dynamic>{
      'earning': instance.earning,
      'profit': instance.profit,
      'totalEarning': instance.totalEarning,
      'totalProfit': instance.totalProfit,
    };
