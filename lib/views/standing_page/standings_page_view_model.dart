import 'package:flutter/material.dart';
import 'package:football_league/app/app.locator.dart';
import 'package:football_league/models/teams_model.dart';
import 'package:football_league/services/api_service.dart';
import 'package:football_league/widgets/snackbar.dart';
import 'package:stacked/stacked.dart';

class StandingsPageViewModel extends ReactiveViewModel {
  final APIService _apiService = locator<APIService>();
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_apiService];
  List<LeagueTable> get teams => _apiService.teamsModel.standings!.first.table;

  getTeams(BuildContext context) async {
    setBusy(true);
    bool _result = await _apiService.getTeamNames();
    if (_result) {
      setBusy(false);
    } else {
      setBusy(false);
    }
  }
}
