import 'package:corp_game_calc/domain/score.dart';

import 'player.dart';

import 'package:json_annotation/json_annotation.dart';

part 'game_round.g.dart';

@JsonSerializable(explicitToJson: true)
class GameRound {
  final List<Player> players;
  final int expense;
  int currentPlayerIndex = -1;
  int currentTotalEarnings = 0;

  GameRound(this.players, this.expense);

  int play(int earning) {
    currentTotalEarnings += earning;
    return earning - expense;
  }

  Player getCurrentPlayer() {
    return players[currentPlayerIndex];
  }

  int getRoundedEarnings() {
    return currentTotalEarnings ~/ players.length;
  }

  bool isFinished() {
    return currentPlayerIndex + 1 >= players.length;
  }

  void loop() {
    currentPlayerIndex++;
  }

  factory GameRound.fromJson(Map<String, dynamic> json) => _$GameRoundFromJson(json);

  Map<String, dynamic> toJson() => _$GameRoundToJson(this);
}
