import 'package:football_league/app/app.locator.dart';
import 'package:football_league/app/routes.dart';
import 'package:football_league/services/api_service.dart';
import 'package:football_league/widgets/snackbar.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:football_league/config/config.dart';
import 'package:football_league/services/navigation_service.dart';

class SettingsViewModel extends ReactiveViewModel {
  final APIService _apiService = locator<APIService>();
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_apiService];
  final NavigationService _navigationService = locator<NavigationService>();
  int _pickedNumber = 1;
  get pickedNumber => _pickedNumber;
  int totalNumbers = 30;
  bool _isSwitched = Config.themeNotifier.value == ThemeMode.dark ? true : false;
  get isSwitched => _isSwitched;

  setnumberOfDays(BuildContext context, int? day) {
    _pickedNumber = day ?? _pickedNumber;
    Config.lastNumberOfDays = _pickedNumber;
    _getTeams();
    ScaffoldMessenger.of(context).showSnackBar(appSnackbar('Settings Changed'));
    notifyListeners();
  }

  _getTeams() async {
    setBusy(true);
    await _apiService.getTeamNames();
    _getMatches();
    setBusy(false);
  }

  _getMatches() async {
    await _apiService.getMatches();
  }

  setSwitch(bool value) {
    Config.themeNotifier.value = value ? ThemeMode.dark : ThemeMode.light;
    _isSwitched = value;
    notifyListeners();
  }

  navigateToHome() {
    _navigationService.navigateTo(Routes.homePageView, clearStack: true);
  }
}
