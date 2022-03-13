import 'package:json_annotation/json_annotation.dart';

part 'score.g.dart';

@JsonSerializable(explicitToJson: true)
class Score {
  Score(this.earning, this.profit, this.totalEarning, this.totalProfit);

  final int earning;
  final int profit;
  final int totalEarning;
  final int totalProfit;

  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);

  Map<String, dynamic> toJson() => _$ScoreToJson(this);
}
