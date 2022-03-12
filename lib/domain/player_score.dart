import 'package:corp_game_calc/domain/player.dart';
import 'package:corp_game_calc/domain/score.dart';

import 'package:json_annotation/json_annotation.dart';

part 'player_score.g.dart';

@JsonSerializable(explicitToJson: true)
class PlayerScore {
  final Player player;
  final List<Score> scores;

  PlayerScore(this.player, this.scores);

  factory PlayerScore.fromJson(Map<String, dynamic> json) => _$PlayerScoreFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerScoreToJson(this);
}
