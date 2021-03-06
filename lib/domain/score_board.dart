import 'package:corp_game_calc/domain/player_score.dart';
import 'package:corp_game_calc/domain/score.dart';
import 'package:corp_game_calc/domain/tax_deducter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'player.dart';

part 'score_board.g.dart';

@JsonSerializable(explicitToJson: true)
class ScoreBoard {

  ScoreBoard(this.players, this.playerScoreMap);

  ScoreBoard.init(this.players);

  final List<Player> players;
  Map<String, List<Score>> playerScoreMap = Map.identity();

  void addScore(Player player, int earning, int profit) {
    List<Score> scores = playerScoreMap.putIfAbsent(
        player.name, () => List.empty(growable: true));
    int previousEarnings = scores.isNotEmpty ? scores.last.totalEarning : 0;
    int previousProfits = scores.isNotEmpty ? scores.last.totalProfit : 0;

    int newProfit = previousProfits + profit;
    newProfit = newProfit - TaxDeducter.getDeductibleAmount(newProfit);
    newProfit = newProfit + TaxDeducter.getGovtFund(newProfit);

    scores.add(Score(earning, profit, previousEarnings + earning, newProfit));
  }

  List<PlayerScore> getPlayerScores() {
    return playerScoreMap.entries
        .map((e) => PlayerScore(
            players.firstWhere((element) => element.name == e.key), e.value))
        .toList();
  }

  factory ScoreBoard.fromJson(Map<String, dynamic> json) =>
      _$ScoreBoardFromJson(json);

  Map<String, dynamic> toJson() => _$ScoreBoardToJson(this);

}
