import 'package:flutter/material.dart';
import 'package:football_league/app/app.locator.dart';
import 'package:football_league/app/routes.dart';
import 'package:football_league/config/config.dart';
import 'package:football_league/models/team_model.dart';
import 'package:football_league/services/api_service.dart';
import 'package:football_league/services/navigation_service.dart';
import 'package:football_league/widgets/snackbar.dart';
import 'package:stacked/stacked.dart';

class HomePageViewModel extends ReactiveViewModel {
  final APIService _apiService = locator<APIService>();
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_apiService];
  TeamModel get bestTeam => _apiService.bestTeam;
  final NavigationService _navigationService = locator<NavigationService>();
  navigateToSettings() {
    _navigationService.navigateTo(Routes.settingsPageView);
  }

  navigateToTeams() {
    _navigationService.navigateTo(Routes.teamsPageView);
  }

  getTeams(BuildContext context) async {
    setBusy(true);
    bool _result = await _apiService.getTeamNames();
    if (_result) {
      bool _matchesResult = await _getMatches();
      if (_matchesResult) {
        setBusy(false);
        ScaffoldMessenger.of(context).showSnackBar(appSnackbar('Most matches won in the last ${Config.lastNumberOfDays} days'));
        return true;
      } else {
        setBusy(false);
        return false;
      }
    } else {
      setBusy(false);
      return false;
    }
  }

  Future<bool> _getMatches() async {
    bool _result = await _apiService.getMatches();
    if (_result) {
      return true;
    } else {
      return false;
    }
  }

  navigateToStandings() {
    _navigationService.navigateTo(Routes.standingsView);
  }

  navigateToMatches() {
    _navigationService.navigateTo(Routes.matchesView);
  }
}
