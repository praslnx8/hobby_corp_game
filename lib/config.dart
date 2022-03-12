import 'package:corp_game_calc/domain/game.dart';
import 'package:corp_game_calc/domain/player.dart';

class Config {
  static Game init() {
    List<Player> players = List.empty(growable: true);

    players.add(Player("Prasi"));
    players.add(Player("VRN"));
    players.add(Player("3XX"));

    return Game(players);
  }
}
