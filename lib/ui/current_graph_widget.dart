import 'package:corp_game_calc/domain/game.dart';
import 'package:fl_animated_linechart/fl_animated_linechart.dart';
import 'package:flutter/material.dart';

class CurrentProfitGraphWidget extends StatelessWidget {
  final Game _game;

  const CurrentProfitGraphWidget(this._game, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<DateTime, double>> chartList = List.empty(growable: true);
    final List<String> units = List.empty(growable: true);
    final List<Color> colorList = List.empty(growable: true);
    int colorCursor = -1;
    _game.getScoreBoard().getPlayerScores().forEach((playerScore) {
      Map<DateTime, double> chartMap = playerScore.scores.asMap().map(
          (key, value) => MapEntry(DateTime(key), value.earning.toDouble()));
      chartList.add(chartMap);
      colorCursor++;
      colorList.add(Colors.primaries[colorCursor]);
      units.add("P");
    });

    if (chartList.length > 2) {
      final LineChart seriesList =
          LineChart.fromDateTimeMaps(chartList, colorList, units);
      return AnimatedLineChart(seriesList);
    }

    return Text('Not Enough Data');
  }
}
