// To parse this JSON data, do
//
//     final teamModel = teamModelFromJson(jsonString);

import 'dart:convert';

TeamModel teamModelFromJson(String str) => TeamModel.fromJson(json.decode(str));

String teamModelToJson(TeamModel data) => json.encode(data.toJson());

class TeamModel {
  TeamModel({
    this.id,
    this.name,
    this.shortName,
    this.tla,
    this.crestUrl,
    this.website,
    this.founded,
    this.clubColors,
    this.venue,
    this.squad,
    this.lastUpdated,
  });

  final int? id;
  final String? name;
  final String? shortName;
  final String? tla;
  final String? crestUrl;
  final String? website;
  final int? founded;
  final String? clubColors;
  final String? venue;
  final List<Squad>? squad;
  final DateTime? lastUpdated;

  TeamModel copyWith({
    int? id,
    String? name,
    String? shortName,
    String? tla,
    String? crestUrl,
    String? website,
    int? founded,
    String? clubColors,
    String? venue,
    List<Squad>? squad,
    DateTime? lastUpdated,
  }) =>
      TeamModel(
        id: id ?? this.id,
        name: name ?? this.name,
        shortName: shortName ?? this.shortName,
        tla: tla ?? this.tla,
        crestUrl: crestUrl ?? this.crestUrl,
        website: website ?? this.website,
        founded: founded ?? this.founded,
        clubColors: clubColors ?? this.clubColors,
        venue: venue ?? this.venue,
        squad: squad ?? this.squad,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
        id: json["id"],
        name: json["name"],
        shortName: json["shortName"],
        tla: json["tla"],
        crestUrl: json["crestUrl"],
        website: json["website"],
        founded: json["founded"],
        clubColors: json["clubColors"],
        venue: json["venue"],
        squad: List<Squad>.from(json["squad"].map((x) => Squad.fromJson(x))),
        lastUpdated: DateTime.parse(json["lastUpdated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "shortName": shortName,
        "tla": tla,
        "crestUrl": crestUrl,
        "website": website,
        "founded": founded,
        "clubColors": clubColors,
        "venue": venue,
        "squad": List<dynamic>.from(squad!.map((x) => x.toJson())),
        "lastUpdated": lastUpdated!.toIso8601String(),
      };
}

class Squad {
  Squad({
    required this.id,
    required this.name,
    this.position,
    required this.dateOfBirth,
    this.countryOfBirth,
    required this.nationality,
  });

  final int id;
  final String name;
  final String? position;
  final DateTime dateOfBirth;
  final String? countryOfBirth;
  final String nationality;

  Squad copyWith({
    int? id,
    String? name,
    String? position,
    DateTime? dateOfBirth,
    String? countryOfBirth,
    String? nationality,
  }) =>
      Squad(
        id: id ?? this.id,
        name: name ?? this.name,
        position: position ?? this.position,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        countryOfBirth: countryOfBirth ?? this.countryOfBirth,
        nationality: nationality ?? this.nationality,
      );

  factory Squad.fromJson(Map<String, dynamic> json) => Squad(
        id: json["id"],
        name: json["name"],
        position: json["position"] ?? '',
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        countryOfBirth: json["countryOfBirth"] ?? '',
        nationality: json["nationality"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "countryOfBirth": countryOfBirth ?? '',
        "nationality": nationality,
      };
}
