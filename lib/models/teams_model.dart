// To parse this JSON data, do
//
//     final teamsModel = teamsModelFromJson(jsonString);

import 'dart:convert';

TeamsModel teamsModelFromJson(String str) => TeamsModel.fromJson(json.decode(str));

String teamsModelToJson(TeamsModel data) => json.encode(data.toJson());

class TeamsModel {
  TeamsModel({
    this.competition,
    this.season,
    this.standings,
  });

  final Competition? competition;
  final Season? season;
  final List<Standing>? standings;

  TeamsModel copyWith({
    Competition? competition,
    Season? season,
    List<Standing>? standings,
  }) =>
      TeamsModel(
        competition: competition ?? this.competition,
        season: season ?? this.season,
        standings: standings ?? this.standings,
      );

  factory TeamsModel.fromJson(Map<String, dynamic> json) => TeamsModel(
        competition: Competition.fromJson(json["competition"]),
        season: Season.fromJson(json["season"]),
        standings: List<Standing>.from(json["standings"].map((x) => Standing.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "competition": competition!.toJson(),
        "season": season!.toJson(),
        "standings": List<dynamic>.from(standings!.map((x) => x.toJson())),
      };
}

class Competition {
  Competition({
    required this.id,
    required this.area,
    required this.name,
    required this.code,
    required this.plan,
    required this.lastUpdated,
  });

  final int id;
  final Area area;
  final String name;
  final String code;
  final String plan;
  final DateTime lastUpdated;

  Competition copyWith({
    int? id,
    Area? area,
    String? name,
    String? code,
    String? plan,
    DateTime? lastUpdated,
  }) =>
      Competition(
        id: id ?? this.id,
        area: area ?? this.area,
        name: name ?? this.name,
        code: code ?? this.code,
        plan: plan ?? this.plan,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
        id: json["id"],
        area: Area.fromJson(json["area"]),
        name: json["name"],
        code: json["code"],
        plan: json["plan"],
        lastUpdated: DateTime.parse(json["lastUpdated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "area": area.toJson(),
        "name": name,
        "code": code,
        "plan": plan,
        "lastUpdated": lastUpdated.toIso8601String(),
      };
}

class Area {
  Area({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  Area copyWith({
    int? id,
    String? name,
  }) =>
      Area(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Season {
  Season({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.currentMatchday,
    required this.winner,
  });

  final int id;
  final DateTime startDate;
  final DateTime endDate;
  final int currentMatchday;
  final dynamic winner;

  Season copyWith({
    int? id,
    DateTime? startDate,
    DateTime? endDate,
    int? currentMatchday,
    dynamic winner,
  }) =>
      Season(
        id: id ?? this.id,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        currentMatchday: currentMatchday ?? this.currentMatchday,
        winner: winner ?? this.winner,
      );

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: json["id"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        currentMatchday: json["currentMatchday"],
        winner: json["winner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "currentMatchday": currentMatchday,
        "winner": winner,
      };
}

class Standing {
  Standing({
    required this.stage,
    required this.type,
    required this.group,
    required this.table,
  });

  final String stage;
  final String type;
  final dynamic group;
  final List<LeagueTable> table;

  Standing copyWith({
    String? stage,
    String? type,
    dynamic group,
    List<LeagueTable>? table,
  }) =>
      Standing(
        stage: stage ?? this.stage,
        type: type ?? this.type,
        group: group ?? this.group,
        table: table ?? this.table,
      );

  factory Standing.fromJson(Map<String, dynamic> json) => Standing(
        stage: json["stage"],
        type: json["type"],
        group: json["group"],
        table: List<LeagueTable>.from(json["table"].map((x) => LeagueTable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "stage": stage,
        "type": type,
        "group": group,
        "table": List<dynamic>.from(table.map((x) => x.toJson())),
      };
}

class LeagueTable {
  LeagueTable({
    required this.position,
    required this.team,
    required this.playedGames,
    required this.form,
    required this.won,
    required this.draw,
    required this.lost,
    required this.points,
    required this.goalsFor,
    required this.goalsAgainst,
    required this.goalDifference,
  });

  final int position;
  final Team team;
  final int playedGames;
  final dynamic form;
  final int won;
  final int draw;
  final int lost;
  final int points;
  final int goalsFor;
  final int goalsAgainst;
  final int goalDifference;

  LeagueTable copyWith({
    int? position,
    Team? team,
    int? playedGames,
    dynamic form,
    int? won,
    int? draw,
    int? lost,
    int? points,
    int? goalsFor,
    int? goalsAgainst,
    int? goalDifference,
  }) =>
      LeagueTable(
        position: position ?? this.position,
        team: team ?? this.team,
        playedGames: playedGames ?? this.playedGames,
        form: form ?? this.form,
        won: won ?? this.won,
        draw: draw ?? this.draw,
        lost: lost ?? this.lost,
        points: points ?? this.points,
        goalsFor: goalsFor ?? this.goalsFor,
        goalsAgainst: goalsAgainst ?? this.goalsAgainst,
        goalDifference: goalDifference ?? this.goalDifference,
      );

  factory LeagueTable.fromJson(Map<String, dynamic> json) => LeagueTable(
        position: json["position"],
        team: Team.fromJson(json["team"]),
        playedGames: json["playedGames"],
        form: json["form"],
        won: json["won"],
        draw: json["draw"],
        lost: json["lost"],
        points: json["points"],
        goalsFor: json["goalsFor"],
        goalsAgainst: json["goalsAgainst"],
        goalDifference: json["goalDifference"],
      );

  Map<String, dynamic> toJson() => {
        "position": position,
        "team": team.toJson(),
        "playedGames": playedGames,
        "form": form,
        "won": won,
        "draw": draw,
        "lost": lost,
        "points": points,
        "goalsFor": goalsFor,
        "goalsAgainst": goalsAgainst,
        "goalDifference": goalDifference,
      };
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.crestUrl,
  });

  final int id;
  final String name;
  final String crestUrl;

  Team copyWith({
    int? id,
    String? name,
    String? crestUrl,
  }) =>
      Team(
        id: id ?? this.id,
        name: name ?? this.name,
        crestUrl: crestUrl ?? this.crestUrl,
      );

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        crestUrl: json["crestUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "crestUrl": crestUrl,
      };
}
