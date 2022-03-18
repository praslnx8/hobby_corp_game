import 'package:corp_game_calc/domain/game_round.dart';
import 'package:corp_game_calc/domain/score_board.dart';
import 'package:json_annotation/json_annotation.dart';

import 'player.dart';

part 'game.g.dart';

@JsonSerializable(explicitToJson: true)
class Game {
  final List<Player> players;
  final ScoreBoard scoreBoard;
  final List<GameRound> gameRounds;


  Game(this.players, this.scoreBoard, this.gameRounds);

  Game.init(this.players)
      : scoreBoard = ScoreBoard.init(players),
        gameRounds = List.empty(growable: true);

  void loop() {
    if (gameRounds.isEmpty) {
      List<Player> gameRoundPlayers = List.from(players);
      gameRoundPlayers.shuffle();
      gameRounds.add(GameRound.init(gameRoundPlayers, _getAvgExpense()));
    }
    GameRound gameRound = gameRounds.last;
    if (gameRound.isFinished()) {
      List<Player> gameRoundPlayers = List.from(players);
      gameRoundPlayers.shuffle();
      gameRound = GameRound.init(gameRoundPlayers, _getAvgExpense());
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
      if(avgExpense > 100) {
        return avgExpense - (avgExpense * 30 ~/ 100);
      }
      return avgExpense - (avgExpense * 15 ~/ 100);
    }
  }

  void addScore(int earning) {
    int profit = gameRounds.last.play(earning);
    Player currentPlayer = gameRounds.last.getCurrentPlayer();
    scoreBoard.addScore(currentPlayer, earning, profit);
  }

  Player? getCurrentPlayer() {
    if(gameRounds.isEmpty) {
      return null;
    }
    return gameRounds.last.getCurrentPlayer();
  }

  int getCurrentRound() {
    return gameRounds.length;
  }

  int getCurrentExpense() {
    if(gameRounds.isEmpty) {
      return 0;
    }
    return gameRounds.last.expense;
  }

  ScoreBoard getScoreBoard() {
    return scoreBoard;
  }

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);
}
