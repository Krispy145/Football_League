// To parse this JSON data, do
//
//     final matchesModel = matchesModelFromJson(jsonString);

import 'dart:convert';

import 'package:football_league/models/teams_model.dart';

MatchesModel matchesModelFromJson(String str) => MatchesModel.fromJson(json.decode(str));

String matchesModelToJson(MatchesModel data) => json.encode(data.toJson());

class MatchesModel {
  MatchesModel({
    this.count,
    this.competition,
    this.matches,
  });

  final int? count;
  final Competition? competition;
  final List<LeagueMatch>? matches;

  MatchesModel copyWith({
    int? count,
    Competition? competition,
    List<LeagueMatch>? matches,
  }) =>
      MatchesModel(
        count: count ?? this.count,
        competition: competition ?? this.competition,
        matches: matches ?? this.matches,
      );

  factory MatchesModel.fromJson(Map<String, dynamic> json) => MatchesModel(
        count: json["count"],
        competition: Competition.fromJson(json["competition"]),
        matches: List<LeagueMatch>.from(json["matches"].map((x) => LeagueMatch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "competition": competition!.toJson(),
        "matches": List<dynamic>.from(matches!.map((x) => x.toJson())),
      };
}

class LeagueMatch {
  LeagueMatch({
    required this.id,
    required this.season,
    required this.utcDate,
    required this.status,
    required this.matchday,
    required this.lastUpdated,
    required this.score,
    required this.homeTeam,
    required this.awayTeam,
  });

  final int id;
  final Season season;
  final DateTime utcDate;
  final String status;
  final int matchday;
  final DateTime lastUpdated;
  final Score score;
  final Area homeTeam;
  final Area awayTeam;

  LeagueMatch copyWith({
    int? id,
    Season? season,
    DateTime? utcDate,
    String? status,
    int? matchday,
    DateTime? lastUpdated,
    Score? score,
    Area? homeTeam,
    Area? awayTeam,
  }) =>
      LeagueMatch(
        id: id ?? this.id,
        season: season ?? this.season,
        utcDate: utcDate ?? this.utcDate,
        status: status ?? this.status,
        matchday: matchday ?? this.matchday,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        score: score ?? this.score,
        homeTeam: homeTeam ?? this.homeTeam,
        awayTeam: awayTeam ?? this.awayTeam,
      );

  factory LeagueMatch.fromJson(Map<String, dynamic> json) => LeagueMatch(
        id: json["id"],
        season: Season.fromJson(json["season"]),
        utcDate: DateTime.parse(json["utcDate"]),
        status: json["status"],
        matchday: json["matchday"],
        lastUpdated: DateTime.parse(json["lastUpdated"]),
        score: Score.fromJson(json["score"]),
        homeTeam: Area.fromJson(json["homeTeam"]),
        awayTeam: Area.fromJson(json["awayTeam"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "season": season.toJson(),
        "utcDate": utcDate.toIso8601String(),
        "status": status,
        "matchday": matchday,
        "lastUpdated": lastUpdated.toIso8601String(),
        "score": score.toJson(),
        "homeTeam": homeTeam.toJson(),
        "awayTeam": awayTeam.toJson(),
      };
}

class Score {
  Score({
    required this.winner,
    required this.duration,
    required this.fullTime,
    required this.halfTime,
    required this.extraTime,
    required this.penalties,
  });

  final String winner;
  final String duration;
  final ExtraTime fullTime;
  final ExtraTime halfTime;
  final ExtraTime extraTime;
  final ExtraTime penalties;

  Score copyWith({
    String? winner,
    String? duration,
    ExtraTime? fullTime,
    ExtraTime? halfTime,
    ExtraTime? extraTime,
    ExtraTime? penalties,
  }) =>
      Score(
        winner: winner ?? this.winner,
        duration: duration ?? this.duration,
        fullTime: fullTime ?? this.fullTime,
        halfTime: halfTime ?? this.halfTime,
        extraTime: extraTime ?? this.extraTime,
        penalties: penalties ?? this.penalties,
      );

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        winner: json["winner"],
        duration: json["duration"],
        fullTime: ExtraTime.fromJson(json["fullTime"]),
        halfTime: ExtraTime.fromJson(json["halfTime"]),
        extraTime: ExtraTime.fromJson(json["extraTime"]),
        penalties: ExtraTime.fromJson(json["penalties"]),
      );

  Map<String, dynamic> toJson() => {
        "winner": winner,
        "duration": duration,
        "fullTime": fullTime.toJson(),
        "halfTime": halfTime.toJson(),
        "extraTime": extraTime.toJson(),
        "penalties": penalties.toJson(),
      };
}

class ExtraTime {
  ExtraTime({
    this.homeTeam,
    this.awayTeam,
  });

  final int? homeTeam;
  final int? awayTeam;

  ExtraTime copyWith({
    int? homeTeam,
    int? awayTeam,
  }) =>
      ExtraTime(
        homeTeam: homeTeam ?? this.homeTeam,
        awayTeam: awayTeam ?? this.awayTeam,
      );

  factory ExtraTime.fromJson(Map<String, dynamic> json) => ExtraTime(
        homeTeam: json["homeTeam"],
        awayTeam: json["awayTeam"],
      );

  Map<String, dynamic> toJson() => {
        "homeTeam": homeTeam,
        "awayTeam": awayTeam,
      };
}

class Season {
  Season({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.currentMatchday,
  });

  final int id;
  final DateTime startDate;
  final DateTime endDate;
  final int currentMatchday;

  Season copyWith({
    int? id,
    DateTime? startDate,
    DateTime? endDate,
    int? currentMatchday,
  }) =>
      Season(
        id: id ?? this.id,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        currentMatchday: currentMatchday ?? this.currentMatchday,
      );

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: json["id"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        currentMatchday: json["currentMatchday"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "currentMatchday": currentMatchday,
      };
}
