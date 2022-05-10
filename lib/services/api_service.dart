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

  Future<bool> getTeamNames() async {
    String url = '$_endpoint/competitions/${Config.league}/standings';
    http.Response _response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (_response.statusCode >= 200 && _response.statusCode <= 205) {
      debugPrint('Teams responseCode: ${_response.statusCode.toString()}');
      _teamsModel.value = teamsModelFromJson(_response.body);
      notifyListeners();
      return true;
    } else {
      debugPrint(_response.body);
      return false;
    }
  }

  Future shuffleTeams() async {
    List<LeagueTable> _teams = _teamsModel.value.standings!.first.table;

    await Future.delayed(const Duration(seconds: 1)).then((value) => _teams.shuffle());
    _shuffleTeams.value = _teams;
    notifyListeners();
  }

  Future<bool> getMatches() async {
    DateTime now = DateTime.now();
    String _toDate = DateFormat('yyyy-MM-dd').format(now);

    String _fromDate = DateFormat('yyyy-MM-dd').format(now.subtract(Duration(days: Config.lastNumberOfDays)));
    String url = '$_endpoint/competitions/${Config.league}/matches?dateFrom=$_fromDate&dateTo=$_toDate&status=FINISHED';
    http.Response _response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (_response.statusCode >= 200 && _response.statusCode <= 205) {
      debugPrint('Matches responseCode: ${_response.statusCode.toString()}');
      _matchesModel.value = matchesModelFromJson(_response.body);
      bool _result = await _getBestTeam();
      if (_result) {
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } else {
      debugPrint(_response.body);
      return false;
    }
  }

  Future<bool> _getBestTeam() async {
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
    http.Response _response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (_response.statusCode >= 200 && _response.statusCode <= 205) {
      debugPrint('Team responseCode: ${_response.statusCode.toString()}');
      _bestTeam.value = teamModelFromJson(_response.body);
      Config.chosenTeam = _bestTeam.value.name!;
      notifyListeners();
      return true;
    } else {
      debugPrint(_response.body);
      return false;
    }
  }
}
