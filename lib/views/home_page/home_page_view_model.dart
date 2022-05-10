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
    await _apiService.getTeamNames();
    await _getMatches();
    ScaffoldMessenger.of(context).showSnackBar(appSnackbar('Most matches won in the last ${Config.lastNumberOfDays} days', leading: const Icon(Icons.info_outline_rounded)));

    setBusy(false);
  }

  _getMatches() async {
    await _apiService.getMatches();
  }

  navigateToStandings() {
    _navigationService.navigateTo(Routes.standingsView);
  }

  navigateToMatches() {
    _navigationService.navigateTo(Routes.matchesView);
  }
}
