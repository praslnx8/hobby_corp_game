import 'package:corp_game_calc/domain/game_round.dart';
import 'package:corp_game_calc/domain/score_board.dart';

import 'player.dart';

import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable(explicitToJson: true)
class Game {
  final List<Player> players;
  final ScoreBoard scoreBoard;
  final List<GameRound> gameRounds;

  Game(this.players)
      : scoreBoard = ScoreBoard(players),
        gameRounds = List.empty(growable: true);

  void loop() {
    if (gameRounds.isEmpty) {
      List<Player> gameRoundPlayers = List.from(players);
      gameRoundPlayers.shuffle();
      gameRounds.add(GameRound(gameRoundPlayers, _getAvgExpense()));
    }
    GameRound gameRound = gameRounds.last;
    if (gameRound.isFinished()) {
      List<Player> gameRoundPlayers = List.from(players);
      gameRoundPlayers.shuffle();
      gameRound = GameRound(gameRoundPlayers, _getAvgExpense());
      gameRounds.add(gameRound);
    }
    gameRound.loop();
  }

  int _getAvgExpense() {
    if (gameRounds.isEmpty) {
      return 0;
    } else if (gameRounds.length == 1) {
      return gameRounds.last.getRoundedEarnings();
    } else {
      int lastEarning = gameRounds.last.getRoundedEarnings();
      int lastBeforeEarning =
          gameRounds[gameRounds.length - 2].getRoundedEarnings();
      int avgExpense = (lastEarning + lastBeforeEarning) ~/ 2;
      int concession = 0;
      return avgExpense - concession;
    }
  }

  void addScore(int earning) {
    int profit = gameRounds.last.play(earning);
    Player currentPlayer = gameRounds.last.getCurrentPlayer();
    scoreBoard.addScore(currentPlayer, earning, profit);
  }

  Player getCurrentPlayer() {
    return gameRounds.last.getCurrentPlayer();
  }

  int getCurrentRound() {
    return gameRounds.length;
  }

  int getCurrentExpense() {
    return gameRounds.last.expense;
  }

  ScoreBoard getScoreBoard() {
    return scoreBoard;
  }

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);
}
