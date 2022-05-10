import 'package:flutter/material.dart';
import 'package:football_league/config/config.dart';
import 'package:football_league/models/matches_model.dart';
import 'package:football_league/models/team_model.dart';
import 'package:football_league/models/teams_model.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

class APIService with ReactiveServiceMixin {
  APIService() {
    listenToReactiveValues([]);
  }
  final String _endpoint = "http://api.football-data.org/v2";
  Map<String, String> headers = {
    'Access-Control-Allow-Methods': "GET",
    'Access-Control-Allow-Origin': "*",
    "Access-Control-Allow-Headers": "x-auth-token, x-response-control",
    "Content-Length": "0",
    "Content-Type": "text/plain",
    "x-auth-token": "c3f95830409740fb8f166b223b8ce98d",
  };

  late final ReactiveValue<TeamsModel> _teamsModel = ReactiveValue<TeamsModel>(TeamsModel(standings: []));
  TeamsModel get teamsModel => _teamsModel.value;
  late final ReactiveValue<List<LeagueTable>> _shuffleTeams = ReactiveValue<List<LeagueTable>>([]);
  List<LeagueTable> get shuffledTeams => _shuffleTeams.value;
  late final ReactiveValue<MatchesModel> _matchesModel = ReactiveValue<MatchesModel>(MatchesModel());
  MatchesModel get matchesModel => _matchesModel.value;
  late final ReactiveValue<TeamModel> _bestTeam = ReactiveValue<TeamModel>(TeamModel());
  TeamModel get bestTeam => _bestTeam.value;

  Future getTeamNames() async {
    String url = '$_endpoint/competitions/${Config.league}/standings';
    await http
        .get(
      Uri.parse(url),
      headers: headers,
    )
        .then((response) {
      debugPrint('Teams responseCode: ${response.statusCode.toString()}');
      _teamsModel.value = teamsModelFromJson(response.body);
      notifyListeners();
    }, onError: (e) {
      debugPrint(e);
    });
  }

  Future shuffleTeams() async {
    List<LeagueTable> _teams = _teamsModel.value.standings!.first.table;

    await Future.delayed(const Duration(seconds: 1)).then((value) => _teams.shuffle());
    _shuffleTeams.value = _teams;
    notifyListeners();
  }

  Future getMatches() async {
    DateTime now = DateTime.now();
    String _toDate = DateFormat('yyyy-MM-dd').format(now);

    String _fromDate = DateFormat('yyyy-MM-dd').format(now.subtract(Duration(days: Config.lastNumberOfDays)));
    String url = '$_endpoint/competitions/${Config.league}/matches?dateFrom=$_fromDate&dateTo=$_toDate&status=FINISHED';
    await http
        .get(
      Uri.parse(url),
      headers: headers,
    )
        .then((response) {
      debugPrint('Matches responseCode: ${response.statusCode.toString()}');
      _matchesModel.value = matchesModelFromJson(response.body);
      _getBestTeam();
      notifyListeners();
    }, onError: (e) {
      debugPrint(e);
    });
  }

  Future _getBestTeam() async {
    Map<String, int> _teamsPlayed = {};
    List<LeagueTable> _teamsRef = _teamsModel.value.standings!.first.table;

    _matchesModel.value.matches?.forEach((match) {
      for (LeagueTable table in _teamsRef) {
        _teamsPlayed.addAll({table.team.name: 0});
      }
      for (LeagueMatch match in _matchesModel.value.matches!) {
        String _winner = '';
        if (match.score.winner == "HOME_TEAM") {
          _winner = match.homeTeam.name;
        } else {
          _winner = match.homeTeam.name;
        }
        _teamsPlayed[_winner] = _teamsPlayed[_winner]! + 1;
      }
    });

    var _sortedTeams = _teamsPlayed.entries.toList()
      ..sort((e1, e2) {
        var diff = e2.value.compareTo(e1.value);
        if (diff == 0) diff = e2.key.compareTo(e1.key);
        return diff;
      });
    Iterable<LeagueTable> _bestTeamRef = _teamsRef.where((team) => team.team.name == _sortedTeams.first.key);
    Team _bestTeamName = _bestTeamRef.first.team;
    String url = '$_endpoint/teams/${_bestTeamName.id}';
    await http
        .get(
      Uri.parse(url),
      headers: headers,
    )
        .then((response) {
      debugPrint('Team responseCode: ${response.statusCode.toString()}');
      _bestTeam.value = teamModelFromJson(response.body);
      Config.chosenTeam = _bestTeam.value.name!;
      notifyListeners();
    }, onError: (e) {
      debugPrint(e);
    });
  }
}
